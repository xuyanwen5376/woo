import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  const ProductDetailsPage({super.key});

  // 滚动图
  Widget _buildBanner(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: "product_banner",
      // tag: tag,
      builder: (_) {
        return CarouselWidget(
          // 打开大图预览
          onTap: controller.onGalleryTap,
          // 图片列表
          items: controller.bannerItems,
          // 当前索引
          currentIndex: controller.bannerCurrentIndex,
          // 切换回调
          onPageChanged: controller.onChangeBanner,
          // 高度
          height: 190.w,
          // 指示器圆点
          indicatorCircle: false,
          // 指示器位置
          indicatorAlignment: MainAxisAlignment.start,
          // 指示器颜色
          indicatorColor: context.colors.scheme.secondary,
        );
      },
    ).backgroundColor(context.colors.scheme.surface);
  }

  // 商品标题
  Widget _buildTitle() {
    return Container(child: Text("商品标题"));
  }

  // Tab 栏位
  Widget _buildTabBar() {
    return Container(child: Text("Tab 栏位"));
  }

  // TabView 视图
  Widget _buildTabView() {
    return Container(child: Text("TabView 视图"));
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return controller.product == null
        ? const PlaceholdWidget() // 占位图
        : <Widget>[
          // 滚动图
          _buildBanner(context),

          // 商品标题
          _buildTitle(),

          // Tab 栏位
          _buildTabBar(),

          // TabView 视图
          _buildTabView(),
        ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      id: "product_details",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: controller.product?.name ?? LocaleKeys.gDetailTitle.tr,
          ),
          body: SafeArea(child: _buildView(context)),
        );
      },
    );
  }
}
