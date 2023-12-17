import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/Models/speedyUser.dart';
import 'package:speedy_recovery_test/global/helpers_methods_functions/firebase_dynamic_link.dart';
import 'package:speedy_recovery_test/global/navigation_routes/app_routes.dart';


class EditProfileController extends GetxController {
  SpeedyUser? speedyUser;
  bool isValid = false;
  final confirmKey = GlobalKey<FormState>();

  bool isConfirmingLoading = false;
  bool isSendingLoading = false;


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String errorConfirming = "";
  String errorVerifingNewEmail = "";

  String message = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }



  @override
  void onInit() async {
    super.onInit();
    dynamic argumentData = Get.arguments;
    speedyUser = argumentData[0];
    nameController.text = speedyUser!.name;
    emailController.text = speedyUser!.email;

    update();
  }

  void confirmNewData() async {
    try {
      isValid = confirmKey.currentState!.validate();

      if (isValid) {
        message = "";

        errorVerifingNewEmail = "";
        errorConfirming = "";

        errorConfirming = "";
        isConfirmingLoading = true;
        update();
        User? user = FirebaseAuth.instance.currentUser;

          await user!.updateDisplayName(nameController.text.trim());
          String link = await DynamicLinksApi().createReferralLink(speedyUser!.id, nameController.text.trim() , true);
          await FirebaseFirestore.instance.collection("users").doc(speedyUser!.id).update(SpeedyUser(id: speedyUser!.id, name: nameController.text.trim(), email: speedyUser!.email, dynamicLink: link).toJson());
          isConfirmingLoading = false;
          update();
          Get.offAllNamed(AppRoutes.mainView ,arguments: [speedyUser!.id.toString()]);






      }
    }on FirebaseAuthException catch (e) {
      print(e.toString());

      if(e.toString().contains("Please verify")){
        errorConfirming = "Please verify your email , firstly";
      }else{
        errorConfirming = e.toString();
      }

      isConfirmingLoading = false;
      update();
    }  catch (e) {
      print(e.toString());

      errorConfirming = e.toString();
      isConfirmingLoading = false;
      update();
    }
  }

  void verifyNewEmail() async {
    try {
      errorVerifingNewEmail = "";
      errorConfirming = "";
        message = "";
        isSendingLoading = true;
        update();

        User? user = FirebaseAuth.instance.currentUser;
        await user!.verifyBeforeUpdateEmail(emailController.text.trim())
        //     .then((value) async {
        //   await FirebaseFirestore.instance.collection("users").doc(user.uid).
        //   update({"email": emailController.text.trim()});
        // })
      ;
        isSendingLoading = false;
        message = "Email address verification email has been sent just now , please check your inbox (also Spam or Junk)";
        update();


    }on FirebaseAuthException catch (e) {

      errorVerifingNewEmail = e.toString();


      isSendingLoading = false;
      update();
    }  catch (e) {
      errorVerifingNewEmail = e.toString();
      isSendingLoading = false;
      update();
    }
  }


}