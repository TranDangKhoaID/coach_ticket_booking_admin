import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/app.dart';
import 'package:tdc_coach_admin/app/storage/app_shared.dart';
import 'package:tdc_coach_admin/firebase_options.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/presentation/detail_seat_driver/controller/detail_seat_controller.dart';
import 'package:tdc_coach_admin/presentation/driver/controller/driver_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/car/controller/add_car_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/detail_driver/controller/detail_driver_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/controller/signup_driver_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/location/controller/location_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/top_up/controller/top_up_controller.dart';

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
  Get.put(TopUpController());
  Get.put(LocationController());
  Get.put(DriverController());
  Get.put(DetailSeatDriverController());
  AppShared.init();
  runApp(const MyApp());
}
