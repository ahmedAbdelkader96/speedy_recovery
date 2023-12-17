import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/edit_profile/edit_profile_controller.dart';


class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}