import 'package:get/get.dart';

import '../../../common/index.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController();

  int? productId = Get.arguments['id'] ?? 0;

  ProductModel? product;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  int bannerCurrentIndex = 0;

  _initData() async {
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

    update(["product_details"]);
  }

  void onChangeBanner(int index, _reason) {
    bannerCurrentIndex = index;
    update(["banner"]);
  }
 
  // 图片浏览
  void onGalleryTap(int index, KeyValueModel item) {
    Get.to(GalleryWidget(
      initialIndex: index,
      items: bannerItems.map<String>((e) => e.value!).toList(),
    ));
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
