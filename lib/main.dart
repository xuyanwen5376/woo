import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'common/index.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      splitScreenMode: false, // 支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字
      builder:
          (context, child) => AdaptiveTheme(
            light: AppTheme.light,
            dark: AppTheme.dark,
            initial: ConfigService.to.themeMode,
            builder:
                (theme, darkTheme) => GetMaterialApp(
                  title: 'Flutter Demo',
                  theme: theme, // 使用 AdaptiveTheme 提供的亮色主题
                  darkTheme: darkTheme, // 使用 AdaptiveTheme 提供的暗色主题
                  // 多语言
                  translations: Translation(), // 词典
                  localizationsDelegates:
                      Translation.localizationsDelegates, // 代理
                  supportedLocales: Translation.supportedLocales, // 支持的语言种类
                  locale: ConfigService.to.locale, // 当前语言种类
                  fallbackLocale: Translation.fallbackLocale, // 默认语言种类
                  // 路由
                  initialRoute: RouteNames.systemSplash,
                  getPages: RoutePages.list,
                  navigatorObservers: [RoutePages.observer],
                  // home: const MyHomePage(title: 'Flutter Demo Home Page'),
                ),
          ),
    );
  }
}
