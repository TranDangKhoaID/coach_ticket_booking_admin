import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/location.dart';
import 'package:tdc_coach_admin/presentation/garage/location/add_location_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/location/component/location_tile.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});
  final DatabaseReference db =
      FirebaseDatabase.instance.ref().child('locations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text('Địa điểm'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
          return LocationTile(location: location);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddLocationScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
