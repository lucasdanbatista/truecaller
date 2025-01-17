import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'telecom_manager_platform_interface.dart';

class MethodChannelTelecomManager extends TelecomManagerPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('telecom_manager');

  @override
  Future<void> enableWhitelist() =>
      methodChannel.invokeMethod<String>('enableWhitelist');
}
