import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';

import '../../../../common/index.dart';
import '../index.dart';

class FilterView extends GetView<SearchFilterController> {
  const FilterView({super.key});

  // 顶部 关闭
  Widget _buildTopBar(BuildContext context) {
    return <Widget>[
      // 文字
      TextWidget.h4(LocaleKeys.searchFilter.tr),

      // 关闭按钮
      ButtonWidget.icon(
        IconWidget.icon(
          Icons.close,
          size: 15,
          color: context.colors.scheme.secondary,
        ),
        onTap: controller.onFilterCloseTap,
      )
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingBottom(AppSpace.listRow);
  }

  Widget _buildView(BuildContext context) {
    return <Widget>[
      // 顶部
      _buildTopBar(context),

      // end
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      id: "filter_view",
      builder: (_) {
        return _buildView(context);
      },
    );
  }
}

