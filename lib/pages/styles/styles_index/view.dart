import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({super.key});

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        Text('13231231'),
        ListTile(
          onTap: controller.onLanguageSelected,
          title: Text("语言 : ${ConfigService.to.locale.toLanguageTag()}"),
        ),
        // 主题
        ListTile(
          onTap: () => controller.onThemeSelected("light"),
          title: Text("亮色 : ${ConfigService.to.themeMode}"),
        ),
        ListTile(
          onTap: () => controller.onThemeSelected("dark"),
          title: Text("暗色 : ${ConfigService.to.themeMode}"),
        ),
        ListTile(
          onTap: () => controller.onThemeSelected("system"),
          title: Text("系统 : ${ConfigService.to.themeMode}"),
        ), // 文本
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesText),
          title: const Text("Text 文本"),
        ),
        // Image 图片
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesImage),
          title: const Text("Image 图片"),
        ), // Icon 图标
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesIcon),
          title: const Text("Icon 图标"),
        ),
        // Button 按钮
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesButton),
          title: const Text("Button 按钮"),
        ),

        // Input 输入框
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesInput),
          title: const Text("Input 输入框"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("styles_index")),
          body: SafeArea(child: _buildView()),
        );
      },
    );
  }
}
