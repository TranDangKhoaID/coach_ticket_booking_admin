import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/auth/auth.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/app/storage/app_shared.dart';
import 'package:tdc_coach_admin/presentation/driver/home_page/home_driver_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/signup_driver.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/detail_trip/detail_trip.dart';
import 'package:tdc_coach_admin/presentation/garage/main_garage_screen.dart';
import 'package:tdc_coach_admin/presentation/sign_in/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: AuthPage(),
    );
  }
}
