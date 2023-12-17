import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedy_recovery_test/features/my_link/my_link_page_controller.dart';
import 'package:speedy_recovery_test/global/widgets/customized_back_button.dart';
import 'package:speedy_recovery_test/global/widgets/normal_raw_material_button.dart';

import '../../global/helpers_methods_functions/media_query.dart';

class MyLinkPage extends StatelessWidget {
  const MyLinkPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyLinkController>(builder: (myLinkController) {
        return !myLinkController.initialized || myLinkController.speedyUser == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
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
                      height: MQuery.getheight(context, 105),
                    ),
                    const Center(
                      child: Text(
                        "My link",
                        style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.w500
                        ),),
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),
                    const Center(
                      child: Text(
                        "Now You can share Your Link",
                        style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.w500
                        ),),
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),

                    Center(
                      child: Text(
                        myLinkController.speedyUser!.dynamicLink,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18,fontWeight: FontWeight.w500
                        ),),
                    ),
                    SizedBox(
                      height: MQuery.getheight(context, 24),
                    ),

                    SizedBox(
                      height: MQuery.getheight(context, 56),
                    ),
                    NormalRawMaterialButton(
                        onPressed: () async {

                           await Share.shareWithResult(myLinkController.speedyUser!.dynamicLink);

                        },
                        height: MQuery.getWidth(context, 56),
                        width: MQuery.getWidth(context, 328),
                        color:  const Color(0xFF017AFE),
                        child:  const Text(
                          "Share",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),





                    SizedBox(
                      height: MQuery.getheight(context, 56),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
