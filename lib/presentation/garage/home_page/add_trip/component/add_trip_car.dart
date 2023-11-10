import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/car.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';

class AddTripCar extends StatelessWidget {
  AddTripCar({super.key});
  final DatabaseReference db = FirebaseDatabase.instance.ref().child('cars');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xe'),
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
          return AddTripCarTile(
            car: car,
            onTap: () {
              AddTripController.instance.selectCar(
                car.name,
                car.id,
              );
            },
          );
        },
      ),
    );
  }
}

class AddTripCarTile extends StatelessWidget {
  final Car car;
  final void Function()? onTap;
  const AddTripCarTile({
    super.key,
    required this.car,
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
          child: Text(car.name),
        ),
        subtitle: Text(car.licensePlates),
      ),
    );
  }
}
