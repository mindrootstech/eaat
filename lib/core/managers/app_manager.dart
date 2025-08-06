import 'package:eaat/utils/locale/app_locale.dart';
import 'package:flutter_localization/flutter_localization.dart';

class AppManager {
  static Future<void> init() async {
    final FlutterLocalization localization = FlutterLocalization.instance;
    await localization.ensureInitialized();
    AppLocale().init();
  }
}
