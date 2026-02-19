import 'package:go_router/go_router.dart';
import 'package:ttobaba/features/my_page/screens/my_page_screen.dart';
import 'package:ttobaba/features/my_page/screens/profile_edit_screen.dart';
import '../../features/initial_question/screens/initial_question_no_like_screen.dart';
import '../../features/initial_question/screens/initial_question_screen.dart';
import '../../features/initial_question/screens/initial_question_start_screen.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/sbti/screens/sbti_no_like_screen.dart';
import '../../features/sbti/screens/sbti_question_screen.dart';
import '../../features/signup/screens/signup_screen.dart';
import '../../features/sbti/screens/sbti_start_screen.dart';

import 'package:ttobaba/features/home/screens/home_screen.dart';
import 'package:ttobaba/features/chat/screens/chat_list_screen.dart';
import 'package:ttobaba/features/chat/screens/detail_chat_screen.dart';
import 'package:ttobaba/features/feedback/screens/feedback_screen.dart';

GoRouter createAppRouter({String initialLocation = '/home'}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
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
        builder: (context, state) => SbtiNoLikeScreen(),
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
        builder: (context, state) => const InitialQuestionScreen(),
      ),
      GoRoute(
        path: '/initial_question_no_like',
        builder: (context, state) => InitialQuestionNoLikeScreen(),
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
        builder: (context, state) => const DetailChatScreen(),
      ),
      // 피드백
      GoRoute(
        path: '/feedback', // /review 로 해도 됨
        builder: (context, state) => const FeedbackScreen(),
      ),
    ],
  );
}

final appRouter = createAppRouter();
