import 'package:get/get.dart';

import '../../../common/index.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();

  // 主题
  onThemeSelected(String themeKey) async {
    await ConfigService.to.setThemeMode(themeKey); 
    update(["styles_index"]);
  }

  // 多语言
  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];

    ConfigService.to.setLanguage(
      ConfigService.to.locale.toLanguageTag() == en.toLanguageTag() ? zh : en,
    );
    update(["styles_index"]);
  }

  _initData() {
    update(["styles_index"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
