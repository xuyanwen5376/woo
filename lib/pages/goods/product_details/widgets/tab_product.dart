import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/index.dart';
import '../index.dart';

/// 商品规格
class TabProductView extends GetView<ProductDetailsController> {
  const TabProductView({super.key});

  // 标题
  _buildTitle(String title) {
    return TextWidget.body(
      title,
      weight: FontWeight.w500,
    ).paddingBottom(AppSpace.listRow);
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
          // 颜色
          _buildTitle("Color22222"),
          GetBuilder<ProductDetailsController>(
            id: "product_colors",
            // tag: uniqueTag,
            builder: (_) {
              return ColorsListWidget(
                itemList: controller.colors,
                keys: controller.colorKeys,
                size: 33.w,
                onTap: controller.onColorTap,
              ).paddingBottom(AppSpace.listRow * 2);
            },
          ),
        ]
        .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
        .paddingVertical(AppSpace.page);
  }
}
