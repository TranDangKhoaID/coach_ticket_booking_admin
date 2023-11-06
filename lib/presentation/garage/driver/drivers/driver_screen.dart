import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/drivers/component/driver_tile.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/signup_driver.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách tài xế'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: AppColor.primary,
      body: Column(
        children: [
          DriverTile(),
          DriverTile(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => SignUpDriver());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
