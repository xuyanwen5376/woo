import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:woo/common/routers/observers.dart';
import 'package:woo/pages/system/login/index.dart';

import '../../pages/system/splash/view.dart';
import 'names.dart';

class RoutePages {

   // 历史记录
  static List<String> history = [];
// 观察者
  static RouteObservers observer = RouteObservers();

  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(), // e same binding for now
    ),
    GetPage(name: RouteNames.systemSplash, page: () => const SplashPage()),
  ];
}
