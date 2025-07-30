import 'package:base/app/bloc/language/language_cubit.dart';
import 'package:base/configs/flavor/flavor_config.dart';
import 'package:base/configs/router/app_router.dart';
import 'package:base/configs/theme/app_theme.dart';
import 'package:base/core/di/injection.dart';
import 'package:base/core/services/language_service.dart';
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

  // Initialize slang localization
  LocaleSettings.useDeviceLocale();

  // Initialize language service
  final languageService = getIt<LanguageService>();
  await languageService.initialize();

  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguageCubit>()..initialize(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: FlavorConfig.title,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
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
