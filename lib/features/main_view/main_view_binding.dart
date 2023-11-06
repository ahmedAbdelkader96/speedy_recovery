import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/main_view/main_view_controller.dart';


class MainViewBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MainViewController());
  }
}