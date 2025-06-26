import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';

class ProductDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProductDetailsController();

  int? productId = Get.arguments['id'] ?? 0;

  ProductModel? product;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  int bannerCurrentIndex = 0;

  // tab 控制器
  late TabController tabController;
  // tab 控制器
  int tabIndex = 0;

  // 颜色列表
  List<KeyValueModel<AttributeModel>> colors = [];
  // 选中颜色列表
  List<String> colorKeys = [];

  // 尺寸列表
  List<KeyValueModel<AttributeModel>> sizes = [];
  // 选中尺寸列表
  List<String> sizeKeys = [];

  _initData() async {
    // 初始化 tab 控制器
    tabController = TabController(length: 3, vsync: this);

    // 商品详情
    await _loadProduct();

    // 读取缓存
    await _loadCache();

    // 监听 tab 切换
    addListenerTab();

    update(["product_details"]);
  }

  void addListenerTab() {
    tabController.addListener(() {
      tabIndex = tabController.index; 
      update(['product_tab']);
    });
  }

  void onChangeBanner(int index, _reason) {
    bannerCurrentIndex = index;
    update(["banner"]);
  }

  // 图片浏览
  void onGalleryTap(int index, KeyValueModel item) {
    Get.to(
      GalleryWidget(
        initialIndex: index,
        items: bannerItems.map<String>((e) => e.value!).toList(),
      ),
    );
  }

  // 切换 tab
  void onTapBarTap(int index) {
    tabIndex = index;
    tabController.animateTo(index);
    update(["product_tab"]);
  }

  void onTap() {}
  // 颜色选中
  void onColorTap(List<String> keys) {
    colorKeys = keys;
    update(["product_colors"]);
  }

  // 尺寸选中
  void onSizeTap(List<String> keys) {
    sizeKeys = keys;
    update(["product_sizes"]);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 商品详情
  _loadProduct() async {
    product = await ProductApi.productDetail(productId.toString());

    // Banner 数据
    if (product?.images != null) {
      bannerItems =
          product!.images!
              .map<KeyValueModel>(
                (e) => KeyValueModel(key: "${e.id}", value: e.src ?? ""),
              )
              .toList();
    }
  }

  // 读取缓存
  _loadCache() async {
    // 颜色列表
    var stringColors = Storage().getString(
      Constants.storageProductsAttributesColors,
    );

    colors =
        stringColors != ""
            ? jsonDecode(stringColors).map<KeyValueModel<AttributeModel>>((
              item,
            ) {
              var arrt = AttributeModel.fromJson(item);
              return KeyValueModel(key: "${arrt.name}", value: arrt);
            }).toList()
            : [];

    // 尺寸列表
    var stringSizes = Storage().getString(
      Constants.storageProductsAttributesSizes,
    );

    sizes =
        stringSizes != ""
            ? jsonDecode(stringSizes).map<KeyValueModel<AttributeModel>>((
              item,
            ) {
              var arrt = AttributeModel.fromJson(item);
              return KeyValueModel(key: "${arrt.name}", value: arrt);
            }).toList()
            : [];
  }

  @override
  void onClose() {
    super.onClose();

    tabController.dispose();
  }
}
