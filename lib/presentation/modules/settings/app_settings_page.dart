import 'package:base/app/bloc/app_cubit.dart';
import 'package:base/generated/translations/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr.language.title)),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr.common.error,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(state.error!),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<AppCubit>().initialize(),
                    child: Text(tr.common.retry),
                  ),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Language Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.language.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      ...state.supportedLocales.map(
                        (locale) => RadioListTile<AppLocale>(
                          title: Text(
                            context.read<AppCubit>().getLanguageDisplayName(
                              locale,
                            ),
                          ),
                          value: locale,
                          groupValue: state.currentLocale,
                          onChanged: (value) {
                            if (value != null) {
                              context.read<AppCubit>().changeLanguage(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Theme Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Theme Settings', // Using hardcoded string since theme translations don't exist
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      ...ThemeMode.values.map(
                        (themeMode) => RadioListTile<ThemeMode>(
                          title: Text(
                            context.read<AppCubit>().getThemeModeDisplayName(
                              themeMode,
                            ),
                          ),
                          value: themeMode,
                          groupValue: state.themeMode,
                          onChanged: (value) {
                            if (value != null) {
                              context.read<AppCubit>().changeTheme(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
