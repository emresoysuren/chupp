import 'package:chupp/services/local_data_service.dart';
import 'package:chupp/utils/theme/config/app_theme_mode.dart';

class LocalData {
  static Future<AppThemeMode> getTheme() async {
    final Map? data = await LDS.instance.read();
    if (data != null) {
      return AppThemeMode.values
          .where((element) => element.name == data["theme"])
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
}
