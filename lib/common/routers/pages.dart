import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../pages/index.dart';
import 'index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
