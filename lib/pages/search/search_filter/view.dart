import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class SearchFilterPage extends GetView<SearchFilterController> {
  const SearchFilterPage({super.key});

  // 搜索过滤栏
  Widget _buildFilterBar(BuildContext context) {
    return <Widget>[
      // 排序 Best Match
      DropdownWidget(
        // 列表
        items: controller.orderList,
        // 提示文字
        hintText: controller.orderSelected.value,
        // 改变事件
        onChanged: controller.onOrderTap,
      )
          .decorated(
            border: Border.all(
              color: context.colors.scheme.outlineVariant,
              width: 0.5,
            ),
          )
          .height(40.h)
          .expanded(),

      // 筛选 Filter
      ButtonWidget.outline(
        LocaleKeys.searchFilter.tr,
        // 反向
        reverse: true,
        // 主轴对齐
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // 主轴大小
        mainAxisSize: MainAxisSize.max,
        // 图标
        icon: const IconWidget.icon(
          Icons.arrow_drop_down,
          // color: context.colors.scheme.outlineVariant,
          size: 26,
        ),
        // 文字颜色
        textColor: context.colors.scheme.onSecondaryContainer,
        // 边框颜色
        borderColor: context.colors.scheme.outlineVariant,
        // 边框圆角
        borderRadius: 0,
        // 阴影
        elevation: 0,
        // 高度
        height: 24.h,
        onTap: controller.onFilterOpenTap,
      ).expanded(),
    ].toRow();
  }


  // 数据列表
  Widget _buildListView() {
    return Text("数据列表");
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return <Widget>[
      // 筛选栏
      _buildFilterBar(context),
      // 数据列表
      _buildListView(),
    ].toColumn();
  }

   @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      init: SearchFilterController(),
      id: "search_filter",
      builder: (_) {
        return Scaffold(
          key: controller.scaffoldKey,
          // 导航
          appBar: mainAppBarWidget(
            // 返回按钮
            leading: ButtonWidget.icon(
              IconWidget.icon(
                Icons.arrow_back,
                color: context.colors.scheme.primary,
              ),
              onTap: () => Get.back(),
            ),
            // 输入文字
            hintText: LocaleKeys.searchPlaceholder.tr,
            // 点击事件
            onTap: () => Get.back(),
          ),
          // 内容
          body: _buildView(context),
 
          // 右侧弹出 Drawer
          endDrawer: const Drawer(
            child: SafeArea(child: FilterView()),
          ),
        );
      },
    );
  }

}
