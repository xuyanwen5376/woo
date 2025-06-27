import 'package:flutter/material.dart';
import 'package:flutter_woo_course_2025/common/index.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  /// 用户名
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");

  /// 密码
  TextEditingController passwordController =
      TextEditingController(text: "123456");

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  _initData() {
    update(["login"]);
  }

  /// Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        // aes 加密密码
        var password = EncryptUtil().aesEncode(passwordController.text);

        // api 请求
        UserTokenModel res = await UserApi.login(UserLoginReq(
          username: userNameController.text,
          password: password,
        ));

        // 本地保存 token
        await UserService.to.setToken(res.token!);

        // 获取用户资料
        await UserService.to.getProfile();

        Loading.success();
        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up 注册
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
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

  /// 释放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
