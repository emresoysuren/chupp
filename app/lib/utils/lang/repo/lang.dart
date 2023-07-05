import 'package:chupp/services/local_data.dart';
import 'package:flutter/material.dart';
import '../config/app_lang_mode.dart';
import '../config/app_langs.dart';
import '../model/app_lang_model.dart';

class AppLang extends ChangeNotifier with WidgetsBindingObserver {
  static final instance = AppLang._();

  AppLang._();

  // Lang Getter | Start

  AppLangModel _current = AppLangs.system;
  AppLangModel get current => _current;

  // Lang Getter | End

  // Lang Modes | Start

  AppLangMode _mode = AppLangMode.system;

  AppLangMode get mode {
    // Won't return AppLangMode.system
    // Because it's not that useful
    if (_mode == AppLangMode.system) {
      final String code =
          WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      if (code == "en") {
        return AppLangMode.en;
      } else if (code == "tr") {
        return AppLangMode.tr;
      } else {
        return AppLangMode.en;
      }
    }
    return _mode;
  }

  AppLangMode get rawMode => _mode;

  // Lang Modes | End

  // Used before the app runs
  Future<void> init() async {
    WidgetsBinding.instance.addObserver(this);
    await changeMode(await LocalData.getLang(), false);
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeLocales(List<Locale>? locales) async {
    await changeMode(await LocalData.getLang(), false);
    notifyListeners();
    super.didChangeLocales(locales);
  }

  Future<void> changeMode(AppLangMode mode, [changeData = true]) async {
    if (changeData) await LocalData.changeLang(mode);
    _mode = mode;
    switch (mode) {
      case AppLangMode.system:
        _current = AppLangs.system;
        break;
      case AppLangMode.en:
        _current = AppLangs.en;
        break;
      case AppLangMode.tr:
        _current = AppLangs.tr;
        break;
    }
    notifyListeners();
  }
}
