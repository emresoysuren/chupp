import 'package:chupp/services/local_data_service.dart';
import 'package:chupp/utils/lang/config/app_lang_mode.dart';
import 'package:chupp/utils/theme/config/app_theme_mode.dart';

class LocalData {
  static Future<AppThemeMode> getTheme() async {
    final Map? data = await LDS.instance.read();
    if (data?["theme"] != null) {
      return AppThemeMode.values
          .where((element) => element.name == data!["theme"])
          .first;
    }
    return AppThemeMode.system;
  }

  static Future<void> changeTheme(AppThemeMode mode) async {
    Map? data = await LDS.instance.read();
    if (data != null) {
      data["theme"] = mode.name;
    } else {
      data = {"theme": mode.name};
    }
    await LDS.instance.write(data);
  }

  static Future<AppLangMode> getLang() async {
    final Map? data = await LDS.instance.read();
    if (data?["lang"] != null) {
      return AppLangMode.values
          .where((element) => element.name == data!["lang"])
          .first;
    }
    return AppLangMode.system;
  }

  static Future<void> changeLang(AppLangMode mode) async {
    Map? data = await LDS.instance.read();
    if (data != null) {
      data["lang"] = mode.name;
    } else {
      data = {"lang": mode.name};
    }
    await LDS.instance.write(data);
  }
}
