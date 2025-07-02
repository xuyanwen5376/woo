import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/index.dart';
import 'index.dart';

class ChatFindUserPage extends GetView<ChatFindUserController> {
  const ChatFindUserPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 已选定用户列表
      _buildSelectedList(),

      // 用户列表
      SmartRefresher(
        controller: controller.refreshController, // 刷新控制器
        enablePullUp: true, // 启用上拉加载
        onRefresh: controller.onRefresh, // 下拉刷新回调
        onLoading: controller.onLoading, // 上拉加载回调
        // footer: const SmartRefresherFooterWidget(), // 底部加载更多
        child: _buildList(),
      ).expanded(),
    ].toColumn().paddingHorizontal(AppSpace.page);
  }

  // 列表
  Widget _buildList() {
    return ListView.separated(
      itemBuilder: (context, index) {
        UserModel item = controller.items[index];
        return _buildListItem(item: item);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppSpace.listRow);
      },
      itemCount: controller.items.length,
    );
  }

  // 列表项
  Widget _buildListItem({required UserModel item}) {
    return ListTile(
      leading:
          item.avatar == null
              ? TextWidget.body(item.nickName!)
              : ImageWidget(
                type: ImageWidgetType.img,
                path: "${Constants.imageServer}/avatar/${item.avatar}",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
      title: Text(item.nickName ?? ""),
      // subtitle: Text(item.email),
      trailing:
          item.nickName == UserService.to.profile.nickName
              ? const Icon(Icons.person_add_disabled_outlined)
              : const Icon(Icons.check_box_outline_blank),
      enabled: item.nickName != UserService.to.profile.nickName,
      onTap:
          item.nickName == UserService.to.profile.nickName
              ? null
              : () {
                controller.onSelectUser(item);
              },
    );
  }

  // 已选定列表
  Widget _buildSelectedList() {
    return Wrap(
      spacing: 5,
      runSpacing: 0,
      children:
          controller.selectedUsers
              .map(
                (item) => Chip(
                  avatar:
                      item.avatar == null
                          ? InitialsWidget(item.nickName!)
                          : AvatarWidget(
                            "${Constants.imageServer}/avatar/${item.avatar}",
                            size: const Size(18, 18),
                          ),
                  label: TextWidget.body(item.nickName ?? "").width(20),
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  onDeleted: () {
                    controller.onCancelSelectUser(item);
                  },
                ),
              )
              .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatFindUserController>(
      init: ChatFindUserController(),
      id: "chat_find_user",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: ButtonWidget.icon(
              IconWidget.icon(Icons.arrow_back_ios_new_outlined),
              onTap: () {
                Get.back();
              },
            ),

            // 搜索栏
            title: InputWidget(
              placeholder: "搜索用户",
              controller: controller.searchEditController,
              // cleanable: true,
              // onChanged: (value) {
              //   controller.searchKeyWord.value = value;
              // },
            ).limitedBox(maxHeight: 50),

            // title: InputWidget.textBorder(
            //   controller: controller.searchEditController,
            // ).limitedBox(maxHeight: 30),
            // 开聊按钮
            actions:
                controller.hasSelectedUser()
                    ? [
                      ButtonWidget.primary(
                        LocaleKeys.chatBtnStart.tr,
                        onTap: controller.onStartChat,
                        height: 30,
                        width: 40,
                      ).paddingRight(5),
                    ]
                    : null,
            // 间距
            titleSpacing: 5,
            // 高度
            toolbarHeight: 30,
          ),
          body: SafeArea(child: _buildView()),
        );
      },
    );
  }
}
