import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PostController extends GetxController {
  PostController();

  List<AssetEntity> selectedAssets = [];

  _initData() {
    update(["post"]);
  }


  // 更新选中的图片
  void updateSelectedAssets(List<AssetEntity> assets) {
    selectedAssets = assets;
    update(["post"]); // 刷新视图
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
