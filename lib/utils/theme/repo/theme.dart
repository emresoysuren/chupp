import 'package:chupp/services/local_data.dart';
import 'package:flutter/material.dart';
import '../config/app_theme_mode.dart';
import '../config/app_themes.dart';
import '../model/app_theme.dart';

class AppTheme extends ChangeNotifier with WidgetsBindingObserver {
  static final instance = AppTheme._();

  AppTheme._();

  AppThemeModel current = AppThemes.system;

  Future<void> init() async {
    WidgetsBinding.instance.addObserver(this);
    await changeMode(await LocalData.getTheme());
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  didChangePlatformBrightness() async {
    await changeMode(await LocalData.getTheme());
    notifyListeners();
    super.didChangePlatformBrightness();
  }

  Future<void> changeMode(AppThemeMode mode) async {
    await LocalData.changeTheme(mode);
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
