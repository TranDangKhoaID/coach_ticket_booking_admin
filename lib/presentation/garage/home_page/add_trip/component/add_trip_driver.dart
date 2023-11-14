import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';

class AddTripDriver extends StatelessWidget {
  AddTripDriver({super.key});
  final DatabaseReference db = FirebaseDatabase.instance.ref().child('drivers');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn tài xế'),
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: FirebaseAnimatedList(
        defaultChild: Center(
          child: CircularProgressIndicator(),
        ),
        query: db,
        itemBuilder: (context, snapshot, animation, index) {
          String id = snapshot.child('id').value.toString();
          String email = snapshot.child('email').value.toString();
          String fullName = snapshot.child('fullName').value.toString();
          String phone = snapshot.child('phone').value.toString();
          String drivingLicense =
              snapshot.child('drivingLicense').value.toString();
          String image = snapshot.child('image').value.toString();
          String status = snapshot.child('status').value.toString();
          final driver = Driver(
            id: id,
            fullName: fullName,
            email: email,
            phone: phone,
            drivingLicense: drivingLicense,
            image: image,
            status: int.parse(status),
          );

          return AddTripDriverTile(
            driver: driver,
            onTap: () {
              AddTripController.instance.selectDriver(
                driver.fullName,
                driver.id,
              );
            },
          );
        },
      ),
    );
  }
}

class AddTripDriverTile extends StatelessWidget {
  final Driver driver;
  final void Function()? onTap;
  const AddTripDriverTile({
    super.key,
    required this.driver,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.primary[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(driver.fullName),
        ),
        subtitle: Text(driver.phone),
      ),
    );
  }
}
