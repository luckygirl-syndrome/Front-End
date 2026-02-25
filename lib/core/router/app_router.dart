import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/auth/auth_provider.dart';
import 'package:ttobaba/features/my_page/screens/my_page_screen.dart';
import 'package:ttobaba/features/my_page/screens/profile_edit_screen.dart';
import '../../features/initial_question/screens/initial_question_no_like_screen.dart';
import '../../features/initial_question/screens/initial_question_screen.dart';
import '../../features/initial_question/screens/initial_question_start_screen.dart';
import '../../features/initial_question/screens/taste_update_complete_screen.dart';
import 'package:ttobaba/features/splash/screens/splash_screen.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/sbti/screens/sbti_no_like_screen.dart';
import '../../features/sbti/screens/sbti_question_screen.dart';
import '../../features/signup/screens/signup_screen.dart';
import '../../features/sbti/screens/sbti_start_screen.dart';

import 'package:ttobaba/features/home/screens/home_screen.dart';
import 'package:ttobaba/features/chat/screens/chat_list_screen.dart';
import 'package:ttobaba/features/chat/screens/detail_chat_screen.dart';
import 'package:ttobaba/features/feedback/screens/feedback_screen.dart';
import 'package:ttobaba/features/chat/screens/chat_survey_screen.dart';

/// A notifier that notifies GoRouter when the auth state changes.
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<bool>>(
      authStateProvider,
      (_, __) => notifyListeners(),
    );
  }
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final appRouterStateProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    // 항상 스플래시에서 시작
    initialLocation: '/splash',
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = ref.read(authStateProvider);

      // 1. 아직 로딩 중이면 판단 보류
      if (authState.isLoading) return null;

      // 2. 인증 여부 확인
      final isLoggedIn = authState.value ?? false;

      // 3. 현재 위치 확인
      final isAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup';

      final isSbtiRoute =
          state.matchedLocation == '/sbti_start' ||
          state.matchedLocation == '/sbti_no_like' ||
          state.matchedLocation == '/sbti_question';

      // 4. 비로그인 상태 제한
      if (!isLoggedIn) {
        final isAllowed = isAuthRoute || isSbtiRoute;
        return isAllowed ? null : '/login';
      }

      // 5. 로그인 상태에서 로그인/회원가입 페이지 접근 시 홈으로 (단, 이미 해당 페이지면 무시)
      if (isLoggedIn && isAuthRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      // 스플래시
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      // 로그인 화면
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/sbti_start',
        builder: (context, state) => const SbtiStartScreen(),
      ),
      GoRoute(
        path: '/sbti_no_like',
        builder: (context, state) => const SbtiNoLikeScreen(),
      ),
      GoRoute(
        path: '/sbti_question',
        builder: (context, state) => const SbtiQuestionScreen(),
      ),
      GoRoute(
        path: '/initial_question_start',
        builder: (context, state) => const InitialQuestionStartScreen(),
      ),
      GoRoute(
        path: '/initial_question',
        builder: (context, state) =>
            InitialQuestionScreen(from: state.uri.queryParameters['from']),
      ),
      GoRoute(
        path: '/initial_question_no_like',
        builder: (context, state) => const InitialQuestionNoLikeScreen(),
      ),
      GoRoute(
        path: '/taste_update_complete',
        builder: (context, state) => const TasteUpdateCompleteScreen(),
      ),
      GoRoute(
        path: '/my_page',
        builder: (context, state) => const MyPageScreen(),
      ),
      GoRoute(
        path: '/profile_edit',
        builder: (context, state) => const ProfileEditScreen(),
      ),
      // 홈 화면
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      // 채팅 목록
      GoRoute(
        path: '/chat_list',
        builder: (context, state) => const ChatListScreen(),
      ),
      // 채팅 상세
      GoRoute(
        path: '/chat/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return DetailChatScreen(userProductId: id);
        },
      ),
      // 채팅 시작 설문 ( q1~qc )
      GoRoute(
        path: '/chat/survey/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ChatSurveyScreen(userProductId: id);
        },
      ),
      // 피드백
      GoRoute(
        path: '/feedback', // /review 로 해도 됨
        builder: (context, state) => const FeedbackScreen(),
      ),
    ],
  );
});
