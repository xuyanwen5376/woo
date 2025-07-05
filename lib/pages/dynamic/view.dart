import 'package:flutter/material.dart';
import 'package:flutter_woo_course_2025/common/widgets/index.dart';
import 'package:flutter_woo_course_2025/pages/index.dart';
import 'package:get/get.dart';

import '../../common/index.dart';
import 'index.dart';

class DynamicPage extends GetView<DynamicController> {
  const DynamicPage({super.key});

  // 主视图
  Widget _buildView() {
    return ButtonWidget(
      onTap: () {
        // 跳转到post
        Get.toNamed(   
          RouteNames.post
        );
      },
      child: const Text("跳转"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DynamicController>(
      init: DynamicController(),
      id: "dynamic",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("dynamic")),
          body: SafeArea(child: _buildView()),
        );
      },
    );
  }
}