import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/Models/speedyUser.dart';


class MyLinkController extends GetxController {

  SpeedyUser? speedyUser;


  @override
  void onInit() async {
    super.onInit();
    dynamic argumentData = Get.arguments;
    speedyUser = argumentData[0];
    update();
  }
}
