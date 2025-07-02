import 'package:flutter/widgets.dart';
import 'package:flutter_woo_course_2025/common/components/refresh_mixin.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:tencent_cloud_chat_sdk/enum/conversation_type.dart';

import '../../../common/index.dart';

class ChatFindUserController extends GetxController with RefreshMixin {
  ChatFindUserController();

  // 刷新控制器
  final refreshController = RefreshController(initialRefresh: true);

  // 搜索控制器
  final TextEditingController searchEditController = TextEditingController();

  // 搜索关键词
  final searchKeyWord = "".obs;

  // 搜索关键词
  String keyword = "";

  // 用户列表
  List<UserModel> items = [];

  // 已选定用户列表
  List<UserModel> selectedUsers = [];

  // 是否选中
  bool isSelected(UserModel user) {
    return selectedUsers.contains(user);
  }

  // 是否有用户选中
  bool hasSelectedUser() {
    return selectedUsers.isNotEmpty;
  }

  // 选择用户
  void onSelectUser(UserModel user) {
    // 已经选中
    if (isSelected(user)) {
      // 移除
      selectedUsers.remove(user);
    } else {
      // 添加
      selectedUsers.add(user);
    }
    update(["chat_find_user"]);
  }

  // 取消选择用户
  void onCancelSelectUser(UserModel user) {
    // 移除
    selectedUsers.remove(user);
    update(["chat_find_user"]);
  }

  // 开始聊天
  Future<void> onStartChat() async {
    if (selectedUsers.isEmpty) {
      return;
    }
    // Get.back(result: selectedUsers);

    await _startChat(selectedUsers);
  } // 选着用户界面

  Future<void> onFindUser() async {
    var result = await Get.toNamed(RouteNames.chatChatFindUser);
    if (result == null || result.isEmpty) return;
    List<UserModel> selectedUsers = result as List<UserModel>;
    log(selectedUsers);
    await _startChat(selectedUsers);
  }

  // 开始聊天
  Future<void> _startChat(List<UserModel> selectedUsers) async {
    if (selectedUsers.isEmpty) {
      return;
    }

    try {
      // 单聊
      if (selectedUsers.length == 1) {
        // 用户 uid
        String uid = selectedUsers.first.username!;

        // tim 数据准备
        // List<String> uids =
        //     selectedUsers
        //         .map((e) => null == e.username ? "" : e.username!)
        //         .toList();
        // await UserApi.chatPrepare(uids);

        // 前去聊天
        Get.toNamed(
          RouteNames.chatChat,
          arguments: {
            "uid": uid,
            "type": ConversationType.V2TIM_C2C.toString(),
          },
        );
      }
    } catch (e) {
      Loading.error(LocaleKeys.chatTipCreateChatFail.tr);
    }

    update(['chat_index']);
  }

  // 初始化数据
  _initData() {
    update(["chat_find_user"]);
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
    _searchDebounce();
  }

  @override
  void onClose() {
    super.onClose();
    refreshController.dispose();
    searchEditController.dispose();
  }

  // 搜索栏位 - 防抖
  void _searchDebounce() {
    // getx 内置防抖处理
    debounce<String>(
      // obs 对象
      searchKeyWord,

      // 回调函数
      (value) async {
        // 调试
        log("debounce -> $value");
        keyword = value; // 赋值给 controller 的 keyword 字段
        refreshController.requestRefresh(); // 触发下拉刷新
        update(["chat_find_user"]);
      },

      // 延迟 500 毫秒
      time: const Duration(milliseconds: 500),
    );

    // 监听搜索框变化
    searchEditController.addListener(() {
      searchKeyWord.value = searchEditController.text;
    });
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
