import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

mixin RefreshMixin<T extends GetxController> on GetxController {
  // 刷新控制器
  final RefreshController refreshController = RefreshController(initialRefresh: true);

  // 分页参数
  int page = 1;
  final int limit = 20;

  // 刷新
  Future<void> handleRefresh(Future<void> Function() refreshLogic) async {
    page = 1;
    await refreshLogic();
    refreshController.refreshCompleted();
  }

  // 加载更多
  Future<void> handleLoading(Future<void> Function() loadingLogic) async {
    page++;
    await loadingLogic();
    refreshController.loadComplete();
  }
}