import 'package:go_router/go_router.dart';
import 'package:turath/features/login/login_screen.dart';
import 'package:turath/features/on_boarding/onboarding_screen.dart';
import 'package:turath/features/sign-up/signup_screen.dart';
import 'package:turath/features/splash/splash_screen.dart';
// import 'package:turath/features/splash/splash_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/on_boarding',
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignupScreen(),
  ),
]);
