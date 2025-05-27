import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo/common/services/wp_http.dart';
import 'package:woo/common/utils/storage.dart';
import 'common/services/config.dart';

class Global {
  static Future<void> init() async {
    // 插件初始化
    WidgetsFlutterBinding.ensureInitialized();

    // 工具类
    await Storage().init();
    
  // 初始化服务
    Get.put<ConfigService>(ConfigService());
    Get.put<WPHttpService>(WPHttpService());

    // 初始化配置
    await ConfigService.to.init();
  }
}

