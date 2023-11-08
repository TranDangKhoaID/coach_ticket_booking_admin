import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/app.dart';
import 'package:tdc_coach_admin/app/storage/app_shared.dart';
import 'package:tdc_coach_admin/firebase_options.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/car/add_car/controller/add_car_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/detail_driver/controller/detail_driver_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/controller/signup_driver_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  Get.put(SignupDriverController());
  Get.put(AddCarController());
  Get.put(DetailDriverController());
  Get.put(AddTripController());
  AppShared.init();
  runApp(const MyApp());
}
