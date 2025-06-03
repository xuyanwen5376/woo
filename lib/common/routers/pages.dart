import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:woo/common/routers/observers.dart';
import 'package:woo/pages/system/buttons/view.dart';
import 'package:woo/pages/system/icon/view.dart';
import 'package:woo/pages/system/image/view.dart';
import 'package:woo/pages/system/input/view.dart';
import 'package:woo/pages/system/login/index.dart';
import 'package:woo/pages/system/text/view.dart';
import 'package:woo/pages/system/welcome/view.dart';

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
    GetPage(name: RouteNames.systemText, page: () => const TextPage()),
    GetPage(name: RouteNames.systemImage, page: () => const ImagePage()),
    GetPage(name: RouteNames.systemIcon, page: () => const IconPage()),
    GetPage(name: RouteNames.systemButtons, page: () => const ButtonsPage()),

    GetPage(name: RouteNames.systemWelcome, page: () => const WelcomePage()),

    GetPage(name: RouteNames.systemInput, page: () => const InputPage()),
  ];
}
