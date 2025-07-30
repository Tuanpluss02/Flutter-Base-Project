import 'package:base/app/bloc/todo_cubit.dart';
import 'package:base/app/pages/home_page.dart';
import 'package:base/app/pages/language_settings_page.dart';
import 'package:base/app/pages/todos/todos_page.dart';
import 'package:base/app/pages/users/users_page.dart';
import 'package:base/app/widgets/global_error_screen.dart';
import 'package:base/core/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String users = '/users';
  static const String todos = '/todos';
  static const String languageSettings = '/language-settings';
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
      GoRoute(
        path: AppRoutes.todos,
        name: 'todos',
        builder: (context, state) => BlocProvider<TodoCubit>(
          create: (context) => getIt<TodoCubit>()..fetchTodos(),
          child: const TodosPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.languageSettings,
        name: 'language-settings',
        builder: (context, state) => const LanguageSettingsPage(),
      ),
    ],
    errorBuilder: (context, state) => const GlobalErrorScreen(),
  );
}
