import 'package:go_router/go_router.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/signup/screens/signup_screen.dart';
// import '../../features/home/screens/home_screen.dart'; // 홈 화면 생기면 주석 해제

final appRouter = GoRouter(
  initialLocation: '/login', // 1. 앱 켰을 때 첫 화면
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
    // 홈 화면 (나중에 추가)
    /*
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    */
  ],
);