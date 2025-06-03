import 'package:carousel_slider/carousel_slider.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo/common/widgets/image.dart';
import 'package:woo/common/widgets/text.dart';

import '../index.dart';
import '../models/welcome_model.dart';

/// 欢迎 slider
class WelcomeSliderWidget extends StatelessWidget {
  /// 项目
  final List<WelcomeModel> items;

  /// 页数发生变化
  final Function(int) onPageChanged;

  /// 控制器
  final CarouselSliderController? carouselController;

  const WelcomeSliderWidget(
    this.items, {
    super.key,
    required this.onPageChanged,
    this.carouselController,
  });

  Widget sliderItem(WelcomeModel item) {
    return Builder(
      builder: (BuildContext context) {
        return <Widget>[
          // 图
          if (item.image != null)
            ImageWidget.img(
              item.image!,
              fit: BoxFit.cover,
            ),

          // 标题
          if (item.title != null)
            TextWidget.h1(
              item.title ?? "",
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
            ),

          // 描述
          if (item.desc != null)
            TextWidget.label(
              item.desc ?? "",
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.center,
            )
        ]
            .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
            .width(MediaQuery.of(context).size.width);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 500.w,
        viewportFraction: 1, // 充满
        enlargeCenterPage: false, // 动画 封面效果
        enableInfiniteScroll: false, // 无限循环
        autoPlay: false, // 自动播放
        onPageChanged: (index, reason) => onPageChanged(index),
      ),
      items: <Widget>[
        for (var item in items) sliderItem(item),
      ].toList(),
    );
  }
}
