import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/Models/speedyUser.dart';
import 'package:speedy_recovery_test/global/navigation_routes/app_routes.dart';




class DynamicLinksApi {
  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  bool isNavigated = false;

  Future<void> handleDynamicLinkFromTerminated({ required BuildContext context,required PendingDynamicLinkData? data}) async {
     if (data != null){
       debugPrint("Opened from getInitialLink");
        handleSuccessLinkingFromTerminated(data, context);
      }

  }
  Future<void> handleDynamicLinkStreamFromTerminated(BuildContext context) async {

    dynamicLinks.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          if (dynamicLink != null) {
            handleSuccessLinkingFromTerminated(dynamicLink, context);
          }
        },
        onError: (OnLinkErrorException e) async {
          debugPrint('onLinkError');
          debugPrint(e.message);
        }
    );
  }
  Future<void> handleSuccessLinkingFromTerminated(PendingDynamicLinkData pendingDynamicLinkData,BuildContext context)  async {


    final Uri deepLink = pendingDynamicLinkData.link;
    bool isUsers = deepLink.pathSegments.contains('users');
    if (isUsers) {
      String userId = deepLink.queryParameters["userId"]!;

      User? user = FirebaseAuth.instance.currentUser;

      DocumentSnapshot<Map<String, dynamic>> doc1 = await FirebaseFirestore.instance.collection("users").doc(user!.uid).get();
      SpeedyUser currentSpeedyUser =  SpeedyUser.fromDocumentSnapshot(doc1);


      DocumentSnapshot<Map<String, dynamic>> doc2 = await FirebaseFirestore.instance.collection("users").doc(userId).get();
      SpeedyUser dynamicSpeedyUser =  SpeedyUser.fromDocumentSnapshot(doc2);
      debugPrint("Contain cards ");

      Get.toNamed(AppRoutes.dynamicUserDetailsSharingPage ,arguments: [dynamicSpeedyUser,currentSpeedyUser]);



      //Get.offAllNamed(AppRoutes.mainView ,arguments: [currentSpeedyUser]);


    }






  }





  Future<void> handleDynamicLink({ required BuildContext context,required PendingDynamicLinkData? data}) async {


    if (data != null){
      debugPrint("Opened from getInitialLink");
      handleSuccessLinking(data, context);
    }


    dynamicLinks.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          //final Uri? deepLink = dynamicLink?.link;

          if (dynamicLink != null) {
            debugPrint("Opened from onLink stream");
            handleSuccessLinking(dynamicLink, context);
          }
        },
        onError: (OnLinkErrorException e) async {
          debugPrint('onLinkError');
          debugPrint(e.message);
        }
    );

  }
  Future<void> handleDynamicLinkStream(BuildContext context) async {

    dynamicLinks.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          //final Uri? deepLink = dynamicLink?.link;

          if (dynamicLink != null) {
             handleSuccessLinking(dynamicLink, context);
          }
        },
        onError: (OnLinkErrorException e) async {
          debugPrint('onLinkError');
          debugPrint(e.message);
        }
    );
  }
  Future<void> handleSuccessLinking(PendingDynamicLinkData pendingDynamicLinkData,BuildContext context)  async {
    final Uri deepLink = pendingDynamicLinkData.link;
    bool isUsers = deepLink.pathSegments.contains('users');
    if (isUsers) {

      String userId = deepLink.queryParameters["userId"]!;




      User? user = FirebaseAuth.instance.currentUser;

      DocumentSnapshot<Map<String, dynamic>> doc1 = await FirebaseFirestore.instance.collection("users").doc(user!.uid).get();
      SpeedyUser currentSpeedyUser =  SpeedyUser.fromDocumentSnapshot(doc1);


      DocumentSnapshot<Map<String, dynamic>> doc2 = await FirebaseFirestore.instance.collection("users").doc(userId).get();
      SpeedyUser dynamicSpeedyUser =  SpeedyUser.fromDocumentSnapshot(doc2);
      debugPrint("Contain cards ");

      Get.toNamed(AppRoutes.dynamicUserDetailsSharingPage ,arguments: [dynamicSpeedyUser,currentSpeedyUser]);



    }
  }










  Future<String> createReferralLink(
      String userId , String name , bool short ) async {
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
      uriPrefix: 'https://injab.page.link',
      link: Uri.parse('https://injab.me/users?userId=$userId'),
      androidParameters: AndroidParameters(
        fallbackUrl: Uri.parse('https://injab.me/users?userId=$userId'),
        packageName: 'com.khedr.speedy_recovery_test',
      ),

      iosParameters: IosParameters(
        bundleId: "com.khedr.speedy_recovery_test",
        fallbackUrl: Uri.parse('https://injab.me/users?userId=$userId'),
      ),

      navigationInfoParameters: NavigationInfoParameters( forcedRedirectEnabled: true),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: '$name link',
        description: 'It is $name link',
        imageUrl: Uri.parse("https://firebasestorage.googleapis.com/v0/b/speedyrecovery-54d1b.appspot.com/o/photo_2023-11-06%2010.04.02.jpeg?alt=media&token=a9ec72b9-c37e-4dac-9e88-3dfed3500ad7&_gl=1*pe6jao*_ga*MTcyMTgwNDE3OC4xNjgwNDQ3MTU4*_ga_CW55HF8NVT*MTY5OTI1NTgwNi40MTguMS4xNjk5MjU4MTg4LjQ1LjAuMA.."),
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await dynamicLinkParameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinkParameters.buildUrl();
    }
    debugPrint("createReferralLink  is : $url");
    return url.toString();
  }






}


