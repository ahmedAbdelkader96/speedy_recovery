import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/splash/splash_page_controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashPageController());
  }
}