import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo/common/values/images.dart';
import 'package:woo/common/widgets/image.dart';
 
import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  // 主视图
  Widget _buildView() {
    return const ImageWidget.img(
      AssetsImages.splashJpg,
      fit: BoxFit.fill, // 填充整个界面
    );

    //   return Column(children: [
    //   ListTile(
    //     onTap: controller.onLanguageSelected,
    //     title: Text(
    //       "语言 : ${ConfigService.to.locale.toLanguageTag()}",
    //     ),
    //   ),

    //     // 主题
    //   ListTile(
    //     onTap: () => controller.onThemeSelected("light"),
    //     title: Text("亮色 : ${ConfigService.to.themeMode}"),
    //   ),
    //   ListTile(
    //     onTap: () => controller.onThemeSelected("dark"),
    //     title: Text("暗色 : ${ConfigService.to.themeMode}"),
    //   ),
    //   ListTile(
    //     onTap: () => controller.onThemeSelected("system"),
    //     title: Text("系统 : ${ConfigService.to.themeMode}"),
    //   ),
    // ]);

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
        return _buildView();
      },
    );
  }
}
