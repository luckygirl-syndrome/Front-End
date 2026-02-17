import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    // 더미 데이터
    final dummyChats = List.generate(
        5,
        (index) => {
              'id': index,
              'title': '[단독] [🔴라이브특가/+뉴컬러/50만장돌파🏆/made] 시오 니트 $index',
              'price': '13,410원',
              'date': '어제',
              'imageUrl': 'assets/images/product_sample.png',
              'status': 'considering', // 고민 중
            });

    state = state.copyWith(
      chatList: dummyChats,
      isLoading: false,
    );
  }
}

// 3. Provider 선언
final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier(ref);
});
