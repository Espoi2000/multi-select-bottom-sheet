import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'multi_select_bottom_sheetsx_platform_interface.dart';

/// An implementation of [MultiSelectBottomSheetsxPlatform] that uses method channels.
class MethodChannelMultiSelectBottomSheetsx extends MultiSelectBottomSheetsxPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('multi_select_bottom_sheetsx');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
