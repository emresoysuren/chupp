import 'package:chupp/services/local_data_service.dart';
import 'package:chupp/utils/theme/config/app_theme_mode.dart';

class LocalData {
  static Future<AppThemeMode> getTheme() async {
    final Map? data = await LDS.instance.read();
    if (data != null) {
      return data["theme"];
    }
    return AppThemeMode.system;
  }

  static Future<void> changeTheme(AppThemeMode theme) async {
    Map? data = await LDS.instance.read();
    if (data != null) {
      data["theme"] = theme;
    } else {
      data = {"theme": theme};
    }
    await LDS.instance.write(data);
  }
}
