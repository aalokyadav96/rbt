import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
  ],
);
