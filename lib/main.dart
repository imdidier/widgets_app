import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/ui/providers/theme_provider.dart';

import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(isDarkModeProvider);
    int selectedIndexColor = ref.watch(selectedIndexColorProvider);

    return MaterialApp.router(
      title: 'Widgets',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedIndexColor, isDarkMode: isDarkMode)
          .getTheme(),
      routerConfig: appRouter,
    );
  }
}
