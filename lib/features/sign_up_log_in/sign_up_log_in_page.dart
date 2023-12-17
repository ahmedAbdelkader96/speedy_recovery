import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/sign_up_log_in_controller.dart';

import 'package:speedy_recovery_test/global/helpers_methods_functions/media_query.dart';

import 'package:speedy_recovery_test/global/widgets/general_text_field_with_floating_label.dart';
import 'package:speedy_recovery_test/global/widgets/normal_raw_material_button.dart';

class SignUpAndLogInPage extends StatefulWidget {
  const SignUpAndLogInPage({Key? key}) : super(key: key);

  @override
  State<SignUpAndLogInPage> createState() => _SignUpAndLogInPageState();
}

class _SignUpAndLogInPageState extends State<SignUpAndLogInPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpAndLogInController>(
        builder: (signUpAndLogInController) {
      return Scaffold(
        body: AnimatedCrossFade(
            crossFadeState: signUpAndLogInController.crossFadeState,
            duration: const Duration(milliseconds: 350),
            reverseDuration: const Duration(milliseconds: 350),
            firstCurve: Curves.linear,
            secondCurve: Curves.linear,
            sizeCurve: Curves.linear,
            firstChild: Form(
              key: signUpAndLogInController.signUpKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

          padding: EdgeInsets.only(right: MQuery.getWidth(context, 16),left: MQuery.getWidth(context, 16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MQuery.getheight(context, 150),
                    ),
                    const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 56),
                    ),
                    GeneralTextFieldWithFloatingLabel(
                      controller: signUpAndLogInController.nameController,
                      labelText: "Name",
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 16),
                    ),
                    GeneralTextFieldWithFloatingLabel(
                      controller: signUpAndLogInController.passwordController,
                      labelText: "Password",
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 16),
                    ),
                    GeneralTextFieldWithFloatingLabel(
                      controller: signUpAndLogInController.emailController,
                      labelText: "Email",
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Email";
                        }

                        // the email is invalid
                        if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value.trim())) {
                          return "Please enter a valid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 56),
                    ),
                    NormalRawMaterialButton(
                        onPressed: () {

                          if (signUpAndLogInController.isSignUpLoading) {
                          } else {
                            signUpAndLogInController.signUp();
                          }
                        },
                        height: MQuery.getheight(context, 60),
                        width: MQuery.getWidth(context, 328),
                        color: const Color(0xFF017AFE),
                        child: signUpAndLogInController.isSignUpLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: MQuery.getWidth(context, 12)),
                        InkWell(
                          onTap: () {
                            signUpAndLogInController.showSecondCrossFade();
                            // signUpAndLogInController.showSecondCrossFade();
                            // signUpAndLogInController.update();
                          },
                          child: const Text(
                            "Log In",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xFF017AFE),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),
                   if(signUpAndLogInController.error.isNotEmpty) Row(
                      children: [
                        Expanded(
                          child: Text(
                            signUpAndLogInController.error,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500,color: Colors.red),
                          ),
                        )
                      ],
                    ),


                    SizedBox(
                      height: MQuery.getheight(context, 56),
                    ),
                  ],
                ),
              ),
            ),
            secondChild: Form(
              key: signUpAndLogInController.logInKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(right: MQuery.getWidth(context, 16),left: MQuery.getWidth(context, 16)),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MQuery.getheight(context, 150),
                    ),
                    const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 56),
                    ),
                    GeneralTextFieldWithFloatingLabel(
                      controller: signUpAndLogInController.emailController,
                      labelText: "Email",
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Email";
                        }

                        // the email is invalid
                        if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value.trim())) {
                          return "Please enter a valid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 16),
                    ),
                    GeneralTextFieldWithFloatingLabel(
                      controller: signUpAndLogInController.passwordController,
                      labelText: "Password",
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 56),
                    ),
                    NormalRawMaterialButton(
                        onPressed: () {
                          if (signUpAndLogInController.isLogInLoading) {
                          } else {
                            signUpAndLogInController.logIn();
                          }
                        },
                        height: MQuery.getheight(context, 60),
                        width: MQuery.getWidth(context, 328),
                        color: const Color(0xFF017AFE),
                        child: signUpAndLogInController.isLogInLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Log In",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Need a new account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: MQuery.getWidth(context, 12)),
                        InkWell(
                          onTap: () {
                            // signUpAndLogInController.showFirstCrossFade();
                            // signUpAndLogInController.update();
                            signUpAndLogInController.showFirstCrossFade();
                          },
                          child: const Text(
                            "Sign Up",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xFF017AFE),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),
                    if(signUpAndLogInController.error.isNotEmpty) Row(
                      children: [
                        Expanded(
                          child: Text(
                            signUpAndLogInController.error,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500,color: Colors.red),
                          ),
                        )
                      ],
                    ),


                    SizedBox(
                      height: MQuery.getheight(context, 56),
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}
