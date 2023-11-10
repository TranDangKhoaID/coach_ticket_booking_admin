import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/location.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/location/component/location_widget.dart';

class LocationDepartScreen extends StatelessWidget {
  LocationDepartScreen({super.key});
  final DatabaseReference db =
      FirebaseDatabase.instance.ref().child('locations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Chọn địa điểm'),
        backgroundColor: AppColor.primary,
      ),
      body: FirebaseAnimatedList(
        defaultChild: const Center(
          child: CircularProgressIndicator(),
        ),
        query: db,
        itemBuilder: (context, snapshot, animation, index) {
          String id = snapshot.child('id').value.toString();
          String name = snapshot.child('name').value.toString();
          String address = snapshot.child('address').value.toString();
          final location = Location(id: id, name: name, address: address);
          return LocationWidget(
            location: location,
            onTap: () {
              AddTripController.instance.selectDepartLocation(location.name);
            },
          );
        },
      ),
    );
  }
}
