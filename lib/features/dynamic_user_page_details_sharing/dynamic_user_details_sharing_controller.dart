import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/Models/speedyUser.dart';


class DynamicUserDetailsSharingController extends GetxController {

  SpeedyUser? dynamicSpeedyUser;
  SpeedyUser? currentSpeedyUser;


  @override
  void onInit() async {
    super.onInit();
    dynamic argumentData = Get.arguments;
    dynamicSpeedyUser = argumentData[0];
    currentSpeedyUser = argumentData[1];

    update();
  }






}
