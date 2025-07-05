import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class DynamicPage extends GetView<DynamicController> {
  const DynamicPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("DynamicPage"),
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
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
