import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'telecom_manager_method_channel.dart';

abstract class TelecomManagerPlatform extends PlatformInterface {
  TelecomManagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static TelecomManagerPlatform _instance = MethodChannelTelecomManager();

  static TelecomManagerPlatform get instance => _instance;

  static set instance(TelecomManagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> enableWhitelist();
}
