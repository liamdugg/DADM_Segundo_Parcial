import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segundo_parcial/core/theme/app_theme.dart';


final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {

  ThemeNotifier() : super(AppTheme());

  void changeColorTheme(int color) {
    state = state.copyWith(selectedColor: color);
  } 

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}
