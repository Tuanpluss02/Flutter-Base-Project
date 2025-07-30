import 'package:base/app/bloc/app_bloc.dart';
import 'package:base/configs/flavor/flavor_config.dart';
import 'package:base/configs/router/app_navigator.dart';
import 'package:base/configs/router/app_router.dart';
import 'package:base/configs/theme/app_theme.dart';
import 'package:base/core/di/injection.dart';
import 'package:base/core/services/alice_service.dart';
import 'package:base/generated/translations/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables based on flavor
  await FlavorConfig.loadEnv();

  // Initialize dependency injection
  await configureDependencies();

  // Initialize Alice with navigator key
  getIt<AliceService>().initialize(navigatorKey: AppRouter.navigatorKey);

  // Initialize AppNavigator
  AppNavigator.initialize();

  // Initialize slang localization
  LocaleSettings.useDeviceLocale();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppBloc>()..add(const AppInitializeEvent()),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: FlavorConfig.title,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            routerConfig: AppRouter.router,
            locale: state.currentLocale?.flutterLocale,
            supportedLocales: AppLocale.values.map((e) => e.flutterLocale),
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
          );
        },
      ),
    );
  }
}
