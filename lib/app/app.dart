import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tdc_coach_admin/app/auth/auth.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/app/storage/app_shared.dart';
import 'package:tdc_coach_admin/presentation/driver/home_driver_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/detail_trip/detail_trip.dart';
import 'package:tdc_coach_admin/presentation/garage/main_garage_screen.dart';
import 'package:tdc_coach_admin/presentation/sign_in/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      initialRoute: '/main_garage',
      getPages: [
        GetPage(
          name: '/main_garage', // Tên đường dẫn mặc định
          page: () => MainGarageScreen(),
        ),
        GetPage(
          name: '/detail_trip', // Tên đường dẫn cho DetailTripScreen
          page: () => DetailTripScreen(
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
