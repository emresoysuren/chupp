import 'package:chupp/services/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../config/app_theme_mode.dart';
import '../config/app_themes.dart';
import '../model/app_theme.dart';

class AppTheme extends ChangeNotifier with WidgetsBindingObserver {
  static final instance = AppTheme._();

  AppTheme._();

  // Theme Getter | Start

  AppThemeModel _current = AppThemes.system;
  AppThemeModel get current => _current;

  // Theme Getter | End

  // Theme Modes | Start

  AppThemeMode _mode = AppThemeMode.system;

  AppThemeMode get mode {
    // Won't return AppThemeMode.system
    // Because it's not that useful
    if (_mode == AppThemeMode.system) {
      return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? AppThemeMode.dark
          : AppThemeMode.light;
    }
    return _mode;
  }

  AppThemeMode get rawMode => _mode;

  // Theme Modes | End

  // Used before the app runs
  Future<void> init() async {
    WidgetsBinding.instance.addObserver(this);
    await changeMode(await LocalData.getTheme(), false);
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  didChangePlatformBrightness() async {
    await changeMode(await LocalData.getTheme(), false);
    notifyListeners();
    super.didChangePlatformBrightness();
  }

  // System UI Overlay | Start

  void resetSystemUiColor() {
    SystemChrome.setSystemUIOverlayStyle(_defaultSystemUIOverlay);
  }

  // Has Custom Nav
  SystemUiOverlayStyle get _defaultSystemUIOverlay {
    final style =
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;
    return style.copyWith(
      systemNavigationBarColor: current.primaryBg,
    );
  }

  // System UI Overlay | End

  Future<void> changeMode(AppThemeMode mode, [changeData = true]) async {
    if (changeData) await LocalData.changeTheme(mode);
    _mode = mode;
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
    resetSystemUiColor();
    notifyListeners();
  }
}
