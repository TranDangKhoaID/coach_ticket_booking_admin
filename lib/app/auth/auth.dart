import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/presentation/driver/home_driver_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/main_garage_screen.dart';
import 'package:tdc_coach_admin/presentation/sign_in/login_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (AuthController.instance.isLoggedIn.value) {
            if (AuthController.instance.userType.value == '0') {
              return const MainGarageScreen();
            } else {
              return const HomeDriverScreen();
            }
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
