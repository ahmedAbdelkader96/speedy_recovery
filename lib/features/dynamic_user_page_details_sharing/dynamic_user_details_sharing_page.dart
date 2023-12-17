import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:speedy_recovery_test/features/dynamic_user_page_details_sharing/dynamic_user_details_sharing_controller.dart';
import 'package:speedy_recovery_test/global/navigation_routes/app_routes.dart';
import 'package:speedy_recovery_test/global/widgets/customized_back_button.dart';

import '../../global/helpers_methods_functions/media_query.dart';

class DynamicUserDetailsSharingPage extends StatelessWidget {
  const DynamicUserDetailsSharingPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<DynamicUserDetailsSharingController>(builder: (dynamicUserDetailsSharingController) {
        return Scaffold(
          body: !dynamicUserDetailsSharingController.initialized || dynamicUserDetailsSharingController.dynamicSpeedyUser == null
              ? const Center(child: CircularProgressIndicator())
              :
          WillPopScope(
            onWillPop: ()async{

              Get.offAllNamed(AppRoutes.mainView ,arguments: [dynamicUserDetailsSharingController.currentSpeedyUser!.id]);


              return false;
            },
            child: GetBuilder<DynamicUserDetailsSharingController>(builder: (dynamicUserDetailsSharingController) {
              return !dynamicUserDetailsSharingController.initialized || dynamicUserDetailsSharingController.dynamicSpeedyUser == null
                  ? const Center(child: CircularProgressIndicator())
                  :
              Column(
                children: [
                  SizedBox(
                    height: MQuery.getheight(context, 45),
                  ),
                  CustomizedBackButton(onPressed: (){
                    Get.offAllNamed(AppRoutes.mainView ,arguments: [dynamicUserDetailsSharingController.currentSpeedyUser!.id]);

                  },),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(right: MQuery.getWidth(context, 16),left: MQuery.getWidth(context, 16)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MQuery.getheight(context, 105),
                          ),
                          const Center(
                            child: Text(
                              "Profile data",
                              style: TextStyle(
                                  fontSize: 18,fontWeight: FontWeight.w500
                              ),),
                          ),
                          SizedBox(
                            height: MQuery.getheight(context, 56),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Name : ",
                                style: TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.w500
                                ),),
                              SizedBox(width: MQuery.getWidth(context, 16),),

                              Expanded(
                                child: Text(
                                  dynamicUserDetailsSharingController.dynamicSpeedyUser!.name,
                                  style: const TextStyle(
                                      fontSize: 15,fontWeight: FontWeight.w500
                                  ),),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MQuery.getheight(context, 24),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              const Text(
                                "Email : ",
                                style: TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.w500
                                ),),
                              SizedBox(width: MQuery.getWidth(context, 16),),
                              Expanded(
                                child: Text(
                                  dynamicUserDetailsSharingController.dynamicSpeedyUser!.email.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,fontWeight: FontWeight.w500
                                  ),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              )

              ;
            }),
          )


        ) ;
      })
      ;
  }
}
