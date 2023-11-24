import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';
import 'package:tdc_coach_admin/presentation/detail_seat_driver/detail_seat_driver.dart';
import 'package:tdc_coach_admin/presentation/detail_seat_driver/detail_seat_driver_trip.dart';
import 'package:tdc_coach_admin/presentation/driver/component/trip_item_driver.dart';
import 'package:tdc_coach_admin/presentation/driver/component/trip_item_driver_history.dart';
import 'package:tdc_coach_admin/presentation/driver/controller/driver_controller.dart';

class HistoryTripScreen extends StatelessWidget {
  HistoryTripScreen({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  DatabaseReference db = FirebaseDatabase.instance.ref().child('trips');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Tài xế'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FirebaseAnimatedList(
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
            int status = snapshot.child('status').value as int;

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
              status: status,
            );
            if (driverId.endsWith(auth.currentUser!.uid) && status == 1) {
              return TripItemDriverHistory(
                trip: trip,
                onTap: () {
                  Get.to(
                    () => DetailSeatDriverTrip(
                      tripID: id,
                      carID: carId,
                    ),
                  );
                },
                onTapConfirm: () {
                  DialogHelper.showConfirmDialog(
                    context: context,
                    onPressConfirm: () {
                      DriverController.instance.confirmTrip(
                        userID: trip.driverId,
                        tripID: trip.id,
                        carID: trip.carId,
                      );
                    },
                    message: 'Xác nhận hoàn thành?',
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
