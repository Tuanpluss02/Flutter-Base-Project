import 'package:base/app/pages/home/home_page.dart';
import 'package:base/app/pages/users/users_page.dart';
import 'package:base/app/widgets/global_error_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String users = '/users';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.users,
        name: 'users',
        builder: (context, state) => const UsersPage(),
      ),
    ],
    errorBuilder: (context, state) => GlobalErrorScreen(),
  );
}
