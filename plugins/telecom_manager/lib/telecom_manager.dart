import 'package:permission_handler/permission_handler.dart';

import 'telecom_manager_platform_interface.dart';

class TelecomManager {
  TelecomManager._();

  static Future<void> enableWhitelist() async {
    await Permission.contacts.request();
    await Permission.phone.request();
    await TelecomManagerPlatform.instance.enableWhitelist();
  }
}
