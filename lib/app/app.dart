import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tdc_coach_admin/app/auth/auth.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/app/storage/app_shared.dart';
import 'package:tdc_coach_admin/presentation/home_page_driver/home_driver_screen.dart';
import 'package:tdc_coach_admin/presentation/home_page_garage/home_garage_screen.dart';
import 'package:tdc_coach_admin/presentation/sign_in/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
      builder: EasyLoading.init(),
    );
  }
}
