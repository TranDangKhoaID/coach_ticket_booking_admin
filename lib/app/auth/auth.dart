import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/app/storage/app_shared.dart';
import 'package:tdc_coach_admin/presentation/driver/home_page/home_driver_screen.dart';
import 'package:tdc_coach_admin/presentation/driver/main_driver_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/main_garage_screen.dart';
import 'package:tdc_coach_admin/presentation/sign_in/login_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged
          if (snapshot.hasData &&
              AuthController.instance.userType.value.endsWith('0')) {
            return MainGarageScreen();
          } else if (snapshot.hasData &&
              AuthController.instance.userType.value.endsWith('1')) {
            return MainDriverScreen();
          }
          //user is not logged
          else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
