import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ButtonPage extends GetView<ButtonController> {
  const ButtonPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ButtonPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonController>(
      init: ButtonController(),
      id: "button",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("button")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
