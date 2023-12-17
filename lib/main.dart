import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:speedy_recovery_test/features/splash/splash_page.dart';
import 'package:speedy_recovery_test/features/splash/splash_page_binding.dart';
import 'package:speedy_recovery_test/global/navigation_routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speedy Recovery Task',
      home: const SplashPage(),
      initialBinding: SplashPageBinding(),
      getPages: AppPages.pages,
    );
  }
}