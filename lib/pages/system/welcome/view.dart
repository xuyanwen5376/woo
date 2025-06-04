import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo/common/components/slider_indicator.dart';
import 'package:woo/common/components/welcome_slider.dart';
import 'package:woo/common/i18n/locale_keys.dart';
import 'package:woo/common/style/space.dart';
import 'package:woo/common/widgets/button.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  /// 轮播图
  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      init: controller,
      builder:
          (controller) =>
              controller.items == null
                  ? const SizedBox()
                  : WelcomeSliderWidget(
                    controller.items!,
                    onPageChanged: controller.onPageChanged,
                    carouselController: controller.carouselController,
                  ),
    );
  }

  /// 控制栏
  Widget _buildBar() {
    return GetBuilder<WelcomeController>(
      id: "bar",
      init: controller,
      builder: (controller) {
        return controller.isShowStart
            ?
            // 开始
            ButtonWidget.primary(
              LocaleKeys.welcomeStart.tr,
              onTap: controller.onToMain,
            ).tight(width: double.infinity)
            : <Widget>[
              // 跳过
              ButtonWidget.ghost(
                LocaleKeys.welcomeSkip.tr,
                onTap: controller.onToMain,
              ),
              // 指示标
              SliderIndicatorWidget(
                length: 3,
                currentIndex: controller.currentIndex,
              ),
              // 下一页
              ButtonWidget.ghost(
                LocaleKeys.welcomeNext.tr,
                onTap: controller.onNext,
              ),
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
      },
    );
  }

  /// 主视图
  Widget _buildView() {
    return <Widget>[
          // slider切换
          _buildSlider(),

          // 控制栏
          _buildBar(),
        ]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .paddingAll(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSlider(), // 假设这是显示欢迎内容的滑块
                  _buildBar(), // 假设这是底部的导航栏或按钮
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
