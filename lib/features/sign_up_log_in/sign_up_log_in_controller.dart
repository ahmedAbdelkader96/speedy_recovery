import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/Models/speedyUser.dart';
import 'package:speedy_recovery_test/global/helpers_methods_functions/firebase_dynamic_link.dart';

import 'package:speedy_recovery_test/global/navigation_routes/app_routes.dart';

class SignUpAndLogInController extends GetxController {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  final signUpKey = GlobalKey<FormState>();
  bool isSignUpValid = false;
  bool isSignUpLoading = false;

  final logInKey = GlobalKey<FormState>();
  bool isLogInValid = false;
  bool isLogInLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String error = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    // signUpKey.currentState!.dispose();
    // logInKey.currentState!.dispose();
  }

  void showFirstCrossFade() async {
    error = "";
    crossFadeState = CrossFadeState.showFirst;
    update();
  }

  void showSecondCrossFade() async {
    error = "";
    crossFadeState = CrossFadeState.showSecond;
    update();
  }

  void signUp() async {
    try {
      isSignUpValid = signUpKey.currentState!.validate();

      if (isSignUpValid) {
        error = "";
        isSignUpLoading = true;
        update();
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());
         await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set(
            SpeedyUser(id: "", name: nameController.text.trim(), email: emailController.text.trim(), dynamicLink: '').toJson());
        String link = await DynamicLinksApi().createReferralLink(userCredential.user!.uid, nameController.text.trim() , true);

        await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).update({"id": userCredential.user!.uid,"dynamicLink":link});


        // DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).get();
        // SpeedyUser speedyUser =  SpeedyUser.fromDocumentSnapshot(doc);

        isSignUpLoading = false;
        update();
        await Get.offAllNamed(AppRoutes.mainView, arguments: [userCredential.user!.uid]);
      }
    }on FirebaseAuthException catch (e) {
      error = e.toString();
      isSignUpLoading = false;
      await FirebaseAuth.instance.signOut();
      update();
    } catch (e) {
      error = e.toString();
      isSignUpLoading = false;
      await FirebaseAuth.instance.signOut();

      update();
    }
  }

  void logIn() async {
    try {
      isLogInValid = logInKey.currentState!.validate();

      if (isLogInValid) {
        error = "";
        isLogInLoading = true;
        update();
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());


        await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).
        update({"email": emailController.text.trim()});


        isLogInLoading = false;





        update();
        await Get.offAllNamed(AppRoutes.mainView,
            arguments: [userCredential.user!.uid]);
      }
    } on FirebaseAuthException catch (e) {
      error = e.toString();
      isLogInLoading = false;
      await FirebaseAuth.instance.signOut();

      update();
    }catch (e) {
      error = e.toString();
      isLogInLoading = false;
      await FirebaseAuth.instance.signOut();

      update();
    }
  }
}
