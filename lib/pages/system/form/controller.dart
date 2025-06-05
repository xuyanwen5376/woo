import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  FormController();

// 表单key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // 用户名
  TextEditingController usernameController = TextEditingController();

  // 密码
  TextEditingController passwordController = TextEditingController();

  _initData() {
    update(["form"]);
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

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
