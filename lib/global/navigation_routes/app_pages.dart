import 'package:get/get.dart';
import 'package:speedy_recovery_test/features/edit_profile/edit_profile_binding.dart';
import 'package:speedy_recovery_test/features/edit_profile/edit_profile_page.dart';
import 'package:speedy_recovery_test/features/main_view/main_view_binding.dart';
import 'package:speedy_recovery_test/features/my_link/my_link_page.dart';
import 'package:speedy_recovery_test/features/my_link/my_link_page_binding.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/sign_up_log_in_binding.dart';
import 'package:speedy_recovery_test/features/sign_up_log_in/sign_up_log_in_page.dart';

import 'package:speedy_recovery_test/global/navigation_routes/app_routes.dart';

import '../../features/dynamic_user_page_details_sharing/dynamic_user_details_sharing_binding.dart';
import '../../features/dynamic_user_page_details_sharing/dynamic_user_details_sharing_page.dart';
import '../../features/main_view/main_view_page.dart';


class AppPages {
  static final List<GetPage> pages = [

    GetPage(
      name: AppRoutes.signUpAndLogInPage,
      page: () =>  const SignUpAndLogInPage(),
      binding: SignUpAndLogInBinding(),
    ),


    GetPage(
      name: AppRoutes.mainView,
      page: () => const MainViewPage(),
      binding: MainViewBinding(),

    ),

    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfilePage(),
      binding: EditProfileBinding(),
    ),


    GetPage(
      name: AppRoutes.myLink,
      page: () => const MyLinkPage(),
      binding: MyLinkBinding(),
    ),

    GetPage(
      name: AppRoutes.dynamicUserDetailsSharingPage,
      page: () => const DynamicUserDetailsSharingPage(),
      binding: DynamicUserDetailsSharingBinding(),
    ),


  ];
}
