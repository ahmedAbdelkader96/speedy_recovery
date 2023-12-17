import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/dynamic_user_page_details_sharing/dynamic_user_details_sharing_controller.dart';

class DynamicUserDetailsSharingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DynamicUserDetailsSharingController());
  }
}