import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:speedy_recovery_test/features/edit_profile/edit_profile_controller.dart';
import 'package:speedy_recovery_test/global/helpers_methods_functions/media_query.dart';
import 'package:speedy_recovery_test/global/widgets/customized_back_button.dart';
import 'package:speedy_recovery_test/global/widgets/general_text_field_with_floating_label.dart';
import 'package:speedy_recovery_test/global/widgets/normal_raw_material_button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: GetBuilder<EditProfileController>(builder: (editProfileController) {
          return !editProfileController.initialized || editProfileController.speedyUser == null
              ? const Center(child: CircularProgressIndicator())
              : Form(
            key: editProfileController.confirmKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MQuery.getheight(context, 45),
                ),
                const CustomizedBackButton(),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(right: MQuery.getWidth(context, 16),left: MQuery.getWidth(context, 16)),

                    child: Column(
                      children: [

                        SizedBox(
                          height: MQuery.getheight(context, 25),
                        ),
                        const Center(
                          child: Text(
                            "Update my profile",
                            style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.w500
                            ),),
                        ),


                        SizedBox(
                          height: MQuery.getheight(context, 36),
                        ),

                        GeneralTextFieldWithFloatingLabel(
                          controller: editProfileController.nameController,
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
                          height: MQuery.getheight(context, 24),
                        ),
                        NormalRawMaterialButton(
                            onPressed: () {

                              if(editProfileController.isConfirmingLoading){

                              }else{
                                editProfileController.confirmNewData();

                              }

                            },
                            height: MQuery.getWidth(context, 56),
                            width: MQuery.getWidth(context, 328),
                            color:  const Color(0xFF017AFE),
                            child: editProfileController.isConfirmingLoading? const CircularProgressIndicator(color: Colors.white,) :  const Text(
                              "Update name",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                        SizedBox(
                          height: MQuery.getheight(context, 8),
                        ),

                        if(editProfileController.errorConfirming.isNotEmpty) Text(
                          editProfileController.errorConfirming,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500,color: Colors.red),
                        ),

                        SizedBox(
                          height: MQuery.getheight(context, 28),
                        ),
                        Divider(indent: MQuery.getWidth(context, 16),endIndent: MQuery.getWidth(context, 16),color: Colors.grey,),






                        SizedBox(
                          height: MQuery.getheight(context, 36),
                        ),
                        const Center(
                          child: Text(
                            "Verify a new email",
                            style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.w500
                            ),),
                        ),
                        // SizedBox(
                        //   height: MQuery.getheight(context, 8),
                        // ),
                        // const Text(
                        //   "(Before submit your updates , you should verify your email firstly)",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //       fontSize: 14, fontWeight: FontWeight.w400,color: Colors.grey),
                        // ),


                        SizedBox(
                          height: MQuery.getheight(context, 36),
                        ),

                        GeneralTextFieldWithFloatingLabel(
                          controller: editProfileController.emailController,
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
                          height: MQuery.getheight(context, 24),
                        ),

                        NormalRawMaterialButton(
                            onPressed: () {

                              if(editProfileController.isSendingLoading){

                              }else{
                                editProfileController.verifyNewEmail();

                              }



                            },
                            height: MQuery.getWidth(context, 56),
                            width: MQuery.getWidth(context, 328),
                            color:  const Color(0xFFEEEEEE),
                            child: editProfileController.isSendingLoading? const CircularProgressIndicator(color: Colors.white,) : const Text(
                              "Verify New Email",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),

                        SizedBox(
                          height: MQuery.getheight(context, 16),
                        ),
                        if(editProfileController.errorVerifingNewEmail.isNotEmpty) Text(
                          editProfileController.errorVerifingNewEmail,
                          textAlign: TextAlign.center,

                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500,color: Colors.red),
                        ),


                        if(editProfileController.message.isNotEmpty) Text(
                          editProfileController.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500,color: Colors.red),
                        ),



                        SizedBox(
                          height: MQuery.getheight(context, 56),
                        ),

                      ],
                    ),
                  ),
                )

              ],
            ),
          );
        }),
      ) ;
  }
}
