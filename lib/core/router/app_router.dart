import 'package:go_router/go_router.dart';
import 'package:ttobaba/features/my_page/screens/my_page_screen.dart';
import 'package:ttobaba/features/my_page/screens/profile_edit_screen.dart';
import '../../features/initial_question/screens/initial_question_no_like_screen.dart';
import '../../features/initial_question/screens/initial_question_screen.dart';
import '../../features/initial_question/screens/initial_question_start_screen.dart';
import '../../features/initial_question/screens/taste_update_complete_screen.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/sbti/screens/sbti_no_like_screen.dart';
import '../../features/sbti/screens/sbti_question_screen.dart';
import '../../features/signup/screens/signup_screen.dart';
import '../../features/sbti/screens/sbti_start_screen.dart';

import 'package:ttobaba/features/home/screens/home_screen.dart';
import 'package:ttobaba/features/chat/screens/chat_list_screen.dart';
import 'package:ttobaba/features/chat/screens/detail_chat_screen.dart';
import 'package:ttobaba/features/chat/widgets/chat_item.dart';
import 'package:ttobaba/features/feedback/screens/feedback_screen.dart';

import 'package:ttobaba/features/splash/screens/splash_screen.dart'; // import 추가
import 'package:ttobaba/features/onboarding/screens/onboarding_screen.dart';

GoRouter createAppRouter({String initialLocation = '/splash'}) {
  // 1. 초기 경로 변경
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      // 스플래시 화면
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      // 온보딩 화면
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      // 로그인 화면
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
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
        builder: (context, state) {
          final from = state.uri.queryParameters['from'];
          return InitialQuestionScreen(from: from);
        },
      ),
      GoRoute(
        path: '/initial_question_no_like',
        builder: (context, state) => const InitialQuestionNoLikeScreen(),
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
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      // 채팅 목록
      GoRoute(
        path: '/chat_list',
        builder: (context, state) => const ChatListScreen(),
      ),
      // 채팅 상세
      GoRoute(
        path: '/detail_chat',
        builder: (context, state) {
          ItemStatus status = ItemStatus.considering;
          Map<String, dynamic>? productData;

          if (state.extra is ItemStatus) {
            status = state.extra as ItemStatus;
          } else if (state.extra is Map<String, dynamic>) {
            final map = state.extra as Map<String, dynamic>;
            status = map['status'] as ItemStatus? ?? ItemStatus.considering;
            productData = map['product_data'] as Map<String, dynamic>?;
          }

          return DetailChatScreen(
            status: status,
            productData: productData,
          );
        },
      ),
      // 피드백
      GoRoute(
        path: '/feedback', // /review 로 해도 됨
        builder: (context, state) => const FeedbackScreen(),
      ),
      // 취향 업데이트 완료
      GoRoute(
        path: '/taste_update_complete',
        builder: (context, state) => const TasteUpdateCompleteScreen(),
      ),
    ],
  );
}

final appRouter = createAppRouter();
