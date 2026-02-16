import 'package:go_router/go_router.dart';
import '../../features/initial_question/screens/initial_question_no_like_screen.dart';
import '../../features/initial_question/screens/initial_question_screen.dart';
import '../../features/initial_question/screens/initial_question_start_screen.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/sbti/screens/sbti_no_like_screen.dart';
import '../../features/sbti/screens/sbti_question_screen.dart';
import '../../features/signup/screens/signup_screen.dart';
import '../../features/sbti/screens/sbti_start_screen.dart';

// import '../../features/home/screens/home_screen.dart'; // 홈 화면 생기면 주석 해제

final appRouter = GoRouter(
  initialLocation: '/initial_question_start', // 1. 앱 켰을 때 첫 화면
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
    // 홈 화면 (나중에 추가)
    /*
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    */
  ],
);