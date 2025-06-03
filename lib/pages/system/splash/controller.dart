import 'package:get/get.dart';
import 'package:woo/common/index.dart';
import 'package:woo/common/services/config.dart';

class SplashController extends GetxController {
  SplashController();

  String title = "";

  _jumpToPage() {
    // 欢迎页
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(RouteNames.systemWelcome);
    });
  }

  // 多语言
  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];

    ConfigService.to.setLanguage(
      ConfigService.to.locale.toLanguageTag() == en.toLanguageTag() ? zh : en,
    );
    update(["=="]);
  }

  // 主题
  onThemeSelected(String themeKey) async {
    await ConfigService.to.setThemeMode(themeKey);
    update(["styles_index"]);
  }

  void onTap(int ticket) {
    title = "GetBuilder -> 点击了第 $ticket 个按钮";
    update(['splash_title']);
  }

  _initData() {
    update(["splash"]);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    // _initData();
    _jumpToPage();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
