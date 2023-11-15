import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/add_trip.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/detail_trip/detail_trip.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/trips/component/trip_item.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  final DatabaseReference db = FirebaseDatabase.instance.ref().child('trips');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text('Danh sách chuyến'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primary,
        actions: [
          IconButton(
            onPressed: () {
              DialogHelper.showConfirmDialog(
                context: context,
                onPressConfirm: () {
                  AuthController.instance.logout();
                },
                message: 'Đăng xuất ?',
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: FirebaseAnimatedList(
        defaultChild: const Center(
          child: CircularProgressIndicator(),
        ),
        query: db,
        itemBuilder: (context, snapshot, animation, index) {
          String id = snapshot.child('id').value.toString();
          String departureDate =
              snapshot.child('departureDate').value.toString();
          String departureLocation =
              snapshot.child('departureLocation').value.toString();
          String destinationLocation =
              snapshot.child('destinationLocation').value.toString();

          String departureTime =
              snapshot.child('departureTime').value.toString();
          String destinationTime =
              snapshot.child('destinationTime').value.toString();
          String price = snapshot.child('price').value.toString();
          String driverId = snapshot.child('driverId').value.toString();
          String carId = snapshot.child('carId').value.toString();

          Trip trip = Trip(
            id: id,
            departureDate: departureDate,
            departureLocation: departureLocation,
            destinationLocation: destinationLocation,
            departureTime: departureTime,
            destinationTime: destinationTime,
            price: int.parse(price),
            driverId: driverId,
            carId: carId,
          );
          return TripItem(
            onTap: () {
              Get.to(
                () => DetailTripScreen(
                  trip: trip,
                ),
              );
            },
            trip: trip,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTrip());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
