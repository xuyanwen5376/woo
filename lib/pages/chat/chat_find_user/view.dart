import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/index.dart';
import 'index.dart';

class ChatFindUserPage extends GetView<ChatFindUserController> {
  const ChatFindUserPage({super.key});

  // 主视图
  Widget _buildView() {
    return  SmartRefresher(
      controller: controller.refreshController,
      onRefresh: controller.onRefresh, 
      onLoading: controller.onLoading,
      child: _buildList(),
    );
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
      leading: item.avatar == null
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
      trailing: item.nickName == UserService.to.profile.nickName
          ? const Icon(Icons.person_add_disabled_outlined)
          : const Icon(Icons.check_box_outline_blank),
      enabled: item.nickName != UserService.to.profile.nickName,
      onTap: item.nickName == UserService.to.profile.nickName ? null : () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatFindUserController>(
      init: ChatFindUserController(),
      id: "chat_find_user",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("chat_find_user")),
          body: SafeArea(
            child: _buildView(), 
          ),
        );
      },
    );
  }
}
