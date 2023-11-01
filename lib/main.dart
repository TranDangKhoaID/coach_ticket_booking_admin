import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/app.dart';
import 'package:tdc_coach_admin/app/storage/app_shared.dart';
import 'package:tdc_coach_admin/firebase_options.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  AppShared.init();
  runApp(const MyApp());
}
