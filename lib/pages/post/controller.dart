import 'package:flutter/material.dart';
import 'package:flutter_woo_course_2025/common/index.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PostController extends GetxController {
  PostController();

  // 内容输入控制器
  final TextEditingController contentController = TextEditingController();

  List<AssetEntity> selectedAssets = [];

  // 是否开始拖拽
  bool isDragNow = false;

  // 是否将要删除
  bool isWillRemove = false;

  _initData() {
    update(["post"]);
  }

  // 更新选中的图片
  void updateSelectedAssets(List<AssetEntity> assets) {
    selectedAssets = assets;
    update(["post"]); // 刷新视图
  }

  // 设置拖拽状态
  void setDragState(bool isDrag) {
    isDragNow = isDrag;
    update(["post"]);
  }

  // 设置删除状态
  void setRemoveState(bool isRemove) {
    isWillRemove = isRemove;
    update(["post"]);
  }

  // 发布
  void post() {
    if (contentController.text.isEmpty) {
      Loading.toast("请输入内容"); 
      return;
    }
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
