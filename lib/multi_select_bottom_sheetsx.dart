
import 'multi_select_bottom_sheetsx_platform_interface.dart';

class MultiSelectBottomSheetsx {
  Future<String?> getPlatformVersion() {
    return MultiSelectBottomSheetsxPlatform.instance.getPlatformVersion();
  }
}
