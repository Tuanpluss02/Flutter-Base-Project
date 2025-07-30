import 'package:base/configs/router/app_navigator.dart';
import 'package:base/configs/router/app_router.dart';
import 'package:base/generated/translations/translations.g.dart';
import 'package:base/presentation/shared/environment_info_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Clean Architecture'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.architecture,
                size: 100,
                color: Color(0xFF6200EE),
              ),
              const SizedBox(height: 32),
              const Text(
                'Welcome to Flutter Clean Architecture Base Project',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'This project demonstrates Clean Architecture principles with BLoC state management, dependency injection, and modern Flutter practices.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const EnvironmentInfoWidget(),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                onPressed: () => AppNavigator.push(AppRoutes.users),
                icon: const Icon(Icons.people),
                label: const Text('View Users'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => AppNavigator.push(AppRoutes.todos),
                icon: const Icon(Icons.checklist),
                label: const Text('View Todos'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () {
                  AppNavigator.push(AppRoutes.appSettings);
                },
                icon: const Icon(Icons.settings),
                label: Text(tr.theme.title),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
