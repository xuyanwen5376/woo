import 'package:flutter/material.dart';
import 'package:flutter_woo_course_2025/pages/post/widgets/postEdit.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostPage extends GetView<PostController> {
  const PostPage({super.key});

  // 主视图
  Widget _buildView() {
    return PostEditPage();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      init: PostController(),
      id: "post",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                // 点击空白处收起键盘
                FocusScope.of(context).unfocus();
              },
              child: _buildView(),
            ),
          ),
        );
      },
    );
  }
}
