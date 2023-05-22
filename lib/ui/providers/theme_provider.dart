import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Mantener valores inmutable
final colorListProvider = Provider((ref) => colorsList);
// Para mantener el estado de una pieza
final isDarkModeProvider = StateProvider<bool>((ref) => false);
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppTheme (personalizado)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  //State = Estado = new AppTheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int selectedColor) {
    state = state.copyWith(selectedColor: selectedColor);
  }
}
