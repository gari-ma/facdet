import 'package:facdet/screens/splash.dart';
import 'package:go_router/go_router.dart';
import '../screens/form_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/form',
        builder: (context, state) => const FormScreen(),
      ),
    ],
  );
}
