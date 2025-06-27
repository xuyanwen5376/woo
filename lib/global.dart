import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 插件初始化
    WidgetsFlutterBinding.ensureInitialized();

    // 工具类
    await Storage().init();

    Loading();

    // 初始化队列
    await Future.wait([
      // 配置服务
      Get.putAsync<ConfigService>(() async => await ConfigService().init()),
      // HTTP 服务
      Get.putAsync<WPHttpService>(() async => WPHttpService()),
      // 用户服务
      Get.putAsync<UserService>(() async => UserService()),
      // 用户 API
    ]).whenComplete(() {});
  }
}
