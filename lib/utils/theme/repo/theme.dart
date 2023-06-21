import 'package:chupp/services/local_data.dart';
import 'package:flutter/material.dart';
import '../config/app_theme_mode.dart';
import '../config/app_themes.dart';
import '../model/app_theme.dart';

class AppTheme extends ChangeNotifier {
  AppThemeModel current = AppThemes.system;

  Future<void> init() async {
    changeMode(await LocalData.getTheme());
    notifyListeners();
  }

  void changeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.system:
        current = AppThemes.system;
        break;
      case AppThemeMode.light:
        current = AppThemes.light;
        break;
      case AppThemeMode.dark:
        current = AppThemes.dark;
        break;
    }
    notifyListeners();
  }
}
