import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:speedy_recovery_test/features/splash/splash_page_controller.dart';
import 'package:speedy_recovery_test/global/helpers_methods_functions/firebase_dynamic_link.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init ();

  }


  Future<void> init ()async{
    final splashPageController = SplashPageController();

    try {
      User? user = FirebaseAuth.instance.currentUser;
        final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
        if (data != null){
          await DynamicLinksApi().handleDynamicLinkFromTerminated(context: context, data: data);
        }else{
          await splashPageController.handleNavigation();
        }
    }  catch (e) {
      await splashPageController.handleNavigation();

    }

  }



  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<SplashPageController>(builder: (splashPageController) {
        return const Scaffold(
          body: Center(
            child: Text("Splash Screen",style: TextStyle(
                fontSize: 24,fontWeight: FontWeight.w500
            ),),
          ),
        );
      })
      ;
  }
}
