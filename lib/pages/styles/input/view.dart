import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InputPage extends GetView<InputController> {
  const InputPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("InputPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputController>(
      init: InputController(),
      id: "input",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("input")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
