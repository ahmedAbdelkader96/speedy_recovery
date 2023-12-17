import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/sign_up_log_in_controller.dart';

class SignUpAndLogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpAndLogInController());
  }
}