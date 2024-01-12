import 'package:flutter_test/flutter_test.dart';
import 'package:multi_select_bottom_sheetsx/multi_select_bottom_sheetsx.dart';
import 'package:multi_select_bottom_sheetsx/multi_select_bottom_sheetsx_platform_interface.dart';
import 'package:multi_select_bottom_sheetsx/multi_select_bottom_sheetsx_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMultiSelectBottomSheetsxPlatform
    with MockPlatformInterfaceMixin
    implements MultiSelectBottomSheetsxPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MultiSelectBottomSheetsxPlatform initialPlatform = MultiSelectBottomSheetsxPlatform.instance;

  test('$MethodChannelMultiSelectBottomSheetsx is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMultiSelectBottomSheetsx>());
  });

  test('getPlatformVersion', () async {
    MultiSelectBottomSheetsx multiSelectBottomSheetsxPlugin = MultiSelectBottomSheetsx();
    MockMultiSelectBottomSheetsxPlatform fakePlatform = MockMultiSelectBottomSheetsxPlatform();
    MultiSelectBottomSheetsxPlatform.instance = fakePlatform;

    expect(await multiSelectBottomSheetsxPlugin.getPlatformVersion(), '42');
  });
}
