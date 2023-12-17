import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/my_link/my_link_page_controller.dart';

class MyLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLinkController());
  }
}