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

  String error = "";
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
        error = "";
        isConfirmingLoading = true;
        update();
        User? user = FirebaseAuth.instance.currentUser;

        await user?.updateEmail(emailController.text.trim());
        await user?.updateDisplayName(nameController.text.trim());
        String link = await DynamicLinksApi().createReferralLink(speedyUser!.id, nameController.text.trim() , true);
       await FirebaseFirestore.instance.collection("users").doc(speedyUser!.id).update(SpeedyUser(id: speedyUser!.id, name: nameController.text.trim(), email: emailController.text.trim(), dynamicLink: link).toJson());
        isConfirmingLoading = false;
        update();
        Get.offAllNamed(AppRoutes.mainView ,arguments: [speedyUser!.id]);



      }
    }on FirebaseAuthException catch (e) {

      if(e.toString().contains("Please verify")){
        error = "Please verify your email , firstly";
      }else{
        error = e.toString();
      }

      isConfirmingLoading = false;
      update();
    }  catch (e) {
      error = e.toString();
      isConfirmingLoading = false;
      update();
    }
  }

  void verifyYourEmail() async {
    try {
        error = "";
        message = "";
        isSendingLoading = true;
        update();
        User? user = FirebaseAuth.instance.currentUser;

      user!.sendEmailVerification();
        isSendingLoading = false;
        message = "Email address verification email has been sent just now , please check your inbox (also Spam or Junk)";
        update();


    }on FirebaseAuthException catch (e) {

      error = e.toString();


      isSendingLoading = false;
      update();
    }  catch (e) {
      error = e.toString();
      isSendingLoading = false;
      update();
    }
  }


}