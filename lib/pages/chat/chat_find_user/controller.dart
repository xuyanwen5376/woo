import 'package:flutter_woo_course_2025/common/components/refresh_mixin.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/index.dart';


class ChatFindUserController extends GetxController with RefreshMixin {
  ChatFindUserController();

  // 搜索关键词
  String keyword = "";

  // 用户列表
  List<UserModel> items = [];

  // 刷新控制器
  final refreshController = RefreshController(initialRefresh: true);

  // 初始化数据
  _initData() {
    update(["chat_find_user"]);
  }

  void onTap() {
    
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    refreshController.dispose();
  }

  @override
  Future<List<UserModel>> loadPageData({
    required int page,
    required int limit,
  }) async {
    return await UserApi.findList(keyword, page: page, pageSize: limit);
  }

  @override
  void onDataRefreshed(List data) {
    items = List<UserModel>.from(data);
    update(["chat_find_user"]);
  }

  @override
  void onDataLoaded(List data) {
    items.addAll(List<UserModel>.from(data));
    update(["chat_find_user"]);
  }
}
