import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:speedy_recovery_test/global/navigation_routes/app_routes.dart';

class SplashPageController extends GetxController {



  Future<void> handleNavigation() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAllNamed(AppRoutes.mainView, arguments: [user.uid]);
    } else {
      Get.toNamed(AppRoutes.signUpAndLogInPage);
    }
  }




}
