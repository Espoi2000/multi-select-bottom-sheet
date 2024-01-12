import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'multi_select_bottom_sheetsx_method_channel.dart';

abstract class MultiSelectBottomSheetsxPlatform extends PlatformInterface {
  /// Constructs a MultiSelectBottomSheetsxPlatform.
  MultiSelectBottomSheetsxPlatform() : super(token: _token);

  static final Object _token = Object();

  static MultiSelectBottomSheetsxPlatform _instance = MethodChannelMultiSelectBottomSheetsx();

  /// The default instance of [MultiSelectBottomSheetsxPlatform] to use.
  ///
  /// Defaults to [MethodChannelMultiSelectBottomSheetsx].
  static MultiSelectBottomSheetsxPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MultiSelectBottomSheetsxPlatform] when
  /// they register themselves.
  static set instance(MultiSelectBottomSheetsxPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
