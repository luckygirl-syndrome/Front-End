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
    await Future.delayed(const Duration(milliseconds: 500)); // API 호출 흉내

    // 더미 데이터 분배 (고민 중 2개, 결정 완료(구매완료 1, 포기 1))
    final dummyChats = [
      {
        'id': 1,
        'title': '[단독] [🔴라이브특가/+뉴컬러/50만장돌파🏆/made] 시오 니트 1',
        'price': '13,410원',
        'date': '어제',
        'imageUrl': 'assets/images/products/product_sample.png',
        'status': 'considering', // 고민 중
      },
      {
        'id': 2,
        'title': '봄버 재킷',
        'price': '45,000원',
        'date': '2일 전',
        'imageUrl': 'assets/images/products/product_sample.png',
        'status': 'purchased', // 결정 완료 - 구매 완료
      },
      {
        'id': 3,
        'title': '가죽 숄더백',
        'price': '89,000원',
        'date': '3일 전',
        'imageUrl': 'assets/images/products/product_sample.png',
        'status': 'gaveUp', // 결정 완료 - 구매 포기
      },
      {
        'id': 4,
        'title': '기본 면 티셔츠',
        'price': '12,000원',
        'date': '4일 전',
        'imageUrl': 'assets/images/products/product_sample.png',
        'status': 'considering', // 고민 중
      },
    ];

    state = state.copyWith(
      chatList: dummyChats,
      isLoading: false,
    );
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
