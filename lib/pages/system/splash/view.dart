import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/services/config.dart';
import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  // 主视图
  Widget _buildView() {
      return Column(children: [
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text(
          "语言 : ${ConfigService.to.locale.toLanguageTag()}",
        ),
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
      ),
    ]);

    //    return Center(
    //   child: Text("SplashPage - ${ConfigService.to.version}"),
    // );
    
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     // 文字标题
    //     GetBuilder<SplashController>(
    //       id: "splash_title",
    //       builder: (_) {
    //         return Center(
    //           child: Text(controller.title),
    //         );
    //       },
    //     ),

    //     // 按钮
    //     ElevatedButton(
    //       onPressed: () {
    //         controller.onTap(DateTime.now().microsecondsSinceEpoch);
    //       },
    //       child: const Text("立刻点击"),
    //     ),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("splash")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
