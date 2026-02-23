import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/features/chat/repositories/chat_repository.dart';

// 1. 채팅 상태 모델
class ChatState {
  final List<Map<String, dynamic>> chatList;
  final bool isLoading;

  ChatState({
    this.chatList = const [],
    this.isLoading = false,
  });

  ChatState copyWith({
    List<Map<String, dynamic>>? chatList,
    bool? isLoading,
  }) {
    return ChatState(
      chatList: chatList ?? this.chatList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// 2. 채팅 Notifier (로직 담당)
class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;

  ChatNotifier(this.ref) : super(ChatState()) {
    // 초기 데이터 로드 (더미 데이터)
    loadChatList();
  }

  Future<void> loadChatList() async {
    state = state.copyWith(isLoading: true);
    try {
      final repository = ref.read(chatRepositoryProvider);
      final chats = await repository.getChatList();
      state = state.copyWith(
        chatList: chats,
        isLoading: false,
      );
    } catch (e) {
      debugPrint("❌ [Load Chat List] Error: $e");
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> startChat(String productUrl) async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      await repository.startChat(productUrl);
      return true;
    } catch (e) {
      debugPrint("❌ [Start Chat] Error: $e");
      return false;
    }
  }

  Future<bool> finalizeSurvey(int q1, int q2, int q3, int qc) async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      await repository.finalizeSurvey(q1: q1, q2: q2, q3: q3, qc: qc);
      return true;
    } catch (e) {
      debugPrint("❌ [Finalize Survey] Error: $e");
      return false;
    }
  }
}

// 3. Provider 선언
final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier(ref);
});
