import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/main_view/main_view_controller.dart';
import 'package:speedy_recovery_test/global/helpers_methods_functions/media_query.dart';
import 'package:speedy_recovery_test/global/navigation_routes/app_routes.dart';

import '../../global/widgets/normal_raw_material_button.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<MainViewController>(builder: (mainViewController) {
        return !mainViewController.initialized || mainViewController.speedyUser == null
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
            : Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: NormalRawMaterialButton(
              onPressed: () async {

                if (mainViewController.isSignOutLoading) {
                } else {
                  mainViewController.logOut();
                }
              },
              height: MQuery.getheight(context, 60),
              width: MQuery.getWidth(context, 328),
              color: const Color(0xFF017AFE),
              child: mainViewController.isSignOutLoading
                  ? const CircularProgressIndicator(
                color: Colors.white,
              )
                  : const Text(
                "Log out",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(right: MQuery.getWidth(context, 16),left: MQuery.getWidth(context, 16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MQuery.getheight(context, 150),
                ),
                Center(
                  child: Text(
                    "Welcome \" ${mainViewController.speedyUser!.name.toString()} \"",
                    style: const TextStyle(
                        fontSize: 18,fontWeight: FontWeight.w500
                    ),),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalRawMaterialButton(
                        onPressed: () {

                          Get.toNamed(AppRoutes.myLink ,arguments: [mainViewController.speedyUser]);

                        },
                        height: MQuery.getWidth(context, 154),
                        width: MQuery.getWidth(context, 154),
                        color:  const Color.fromRGBO(104, 104, 104, 0.25),
                        child:  const Text(
                          "My link",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),

                    NormalRawMaterialButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.editProfile ,arguments: [mainViewController.speedyUser]);
                        },
                        height: MQuery.getWidth(context, 154),
                        width: MQuery.getWidth(context, 154),
                        color: const Color.fromRGBO(104, 104, 104, 0.25),
                        child:  const Text(
                          "My profile",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  ],
                )


              ],
            ),
          ),
        );
      }) ;
  }
}
