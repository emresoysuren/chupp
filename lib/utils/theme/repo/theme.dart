import 'package:chupp/services/local_data.dart';
import 'package:flutter/material.dart';
import '../config/app_theme_mode.dart';
import '../config/app_themes.dart';
import '../model/app_theme.dart';

class AppTheme extends ChangeNotifier with WidgetsBindingObserver {
  static final instance = AppTheme._();

  AppTheme._();

  AppThemeModel _current = AppThemes.system;

  AppThemeModel get current => _current;

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
        _current = AppThemes.system;
        break;
      case AppThemeMode.light:
        _current = AppThemes.light;
        break;
      case AppThemeMode.dark:
        _current = AppThemes.dark;
        break;
    }
    notifyListeners();
  }
}
