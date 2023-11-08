import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/detail_driver/detail_driver.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/drivers/component/driver_tile.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/signup_driver.dart';

class DriverScreen extends StatelessWidget {
  DriverScreen({super.key});

  final DatabaseReference database =
      FirebaseDatabase.instance.ref().child('drivers');

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
      body: FirebaseAnimatedList(
        defaultChild: const Center(
          child: CircularProgressIndicator(),
        ),
        query: database,
        itemBuilder: (context, snapshot, animation, index) {
          String id = snapshot.child('id').value.toString();
          String email = snapshot.child('email').value.toString();
          String fullName = snapshot.child('fullName').value.toString();
          String phone = snapshot.child('phone').value.toString();
          String drivingLicense =
              snapshot.child('drivingLicense').value.toString();
          String image = snapshot.child('image').value.toString();
          final driver = Driver(
            id: id,
            fullName: fullName,
            email: email,
            phone: phone,
            drivingLicense: drivingLicense,
            image: image,
          );

          return DriverTile(
            driver: driver,
            onTap: () {
              Get.to(
                () => DetailDriver(
                  driver: driver,
                ),
              );
            },
          );
        },
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
