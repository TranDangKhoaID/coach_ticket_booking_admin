import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/car.dart';
import 'package:tdc_coach_admin/presentation/garage/car/add_car/add_car.dart';
import 'package:tdc_coach_admin/presentation/garage/car/cars/component/car_tile.dart';

class CarScreen extends StatelessWidget {
  CarScreen({super.key});
  final DatabaseReference dbCar = FirebaseDatabase.instance.ref().child('cars');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text('Danh sách xe'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FirebaseAnimatedList(
        defaultChild: const Center(
          child: CircularProgressIndicator(),
        ),
        query: dbCar,
        itemBuilder: (context, snapshot, animation, index) {
          String id = snapshot.child('id').value.toString();
          String name = snapshot.child('name').value.toString();
          String licensePlates =
              snapshot.child('licensePlates').value.toString();
          String image = snapshot.child('image').value.toString();
          int status = snapshot.child('status').value as int;
          final car = Car(
            id: id,
            name: name,
            licensePlates: licensePlates,
            image: image,
            status: status,
          );
          return CarTile(car: car);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddCar());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
