import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/Models/speedyUser.dart';
import 'package:speedy_recovery_test/global/navigation_routes/app_routes.dart';



class MainViewController extends GetxController {
  String? currentUserId;
  SpeedyUser? speedyUser ;
   bool isSignOutLoading = false;


  @override
  void onInit() async {
    super.onInit();
    dynamic argumentData = Get.arguments;
    currentUserId = argumentData[0];
    print("currentUserId is : $currentUserId");
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance.collection("users").doc(currentUserId).get();
    speedyUser =  SpeedyUser.fromDocumentSnapshot(doc);
    update();
  }



   void logOut() async {
     try {
       isSignOutLoading = true;
       update();
       await FirebaseAuth.instance.signOut();
       isSignOutLoading = false;
       update();
       Get.offAllNamed(AppRoutes.signUpAndLogInPage);

     } on FirebaseAuthException catch (e) {
       isSignOutLoading = false;
       update();
     } catch (e) {
       isSignOutLoading = false;
       update();

     }
   }



}