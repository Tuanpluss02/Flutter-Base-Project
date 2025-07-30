import 'package:base/core/di/injection.dart';
import 'package:base/presentation/modules/home/home_page.dart';
import 'package:base/presentation/modules/settings/app_settings_page.dart';
import 'package:base/presentation/modules/todo/cubit/todo_cubit.dart';
import 'package:base/presentation/modules/todo/todos_page.dart';
import 'package:base/presentation/modules/users/users_page.dart';
import 'package:base/presentation/shared/global_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String users = '/users';
  static const String todos = '/todos';
  static const String appSettings = '/app-settings';
}

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.users,
        builder: (context, state) => const UsersPage(),
      ),
      GoRoute(
        path: AppRoutes.todos,
        builder: (context, state) => BlocProvider<TodoCubit>(
          create: (context) => getIt<TodoCubit>()..fetchTodos(),
          child: const TodosPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.appSettings,
        builder: (context, state) => const AppSettingsPage(),
      ),
    ],
    errorBuilder: (context, state) => const GlobalErrorScreen(),
  );
}
