import 'package:flutter/material.dart';
import 'package:base/configs/router/app_router.dart';
import 'package:base/configs/theme/app_theme.dart';
import 'package:base/configs/flavor/flavor_config.dart';
import 'package:base/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables based on flavor
  await FlavorConfig.loadEnv();
  
  // Initialize dependency injection
  await configureDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: FlavorConfig.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
