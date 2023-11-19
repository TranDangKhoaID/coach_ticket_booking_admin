import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/seat.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';
import 'package:tdc_coach_admin/presentation/driver/component/seat_item_driver.dart';
import 'package:tdc_coach_admin/presentation/driver/component/trip_item_driver.dart';
import 'package:tdc_coach_admin/presentation/driver/controller/driver_controller.dart';

// ignore: must_be_immutable
class HomeDriverScreen extends StatelessWidget {
  HomeDriverScreen({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference db = FirebaseDatabase.instance.ref().child('trips');
  DatabaseReference dbSeat = FirebaseDatabase.instance.ref().child('seats');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Tài xế'),
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
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
                  DriverController.instance.carID.value = carId;
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
                  if (driverId.endsWith(auth.currentUser!.uid)) {
                    return TripItemDriver(
                      trip: trip,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FirebaseAnimatedList(
                  query: dbSeat.child(DriverController.instance.carID.value),
                  itemBuilder: (context, snapshot, animation, index) {
                    String id = snapshot.child('id').value.toString();
                    int code = snapshot.child('code').value as int;
                    String name = snapshot.child('name').value.toString();
                    String userID = snapshot.child('userID').value.toString();
                    String userPhone =
                        snapshot.child('userPhone').value.toString();
                    int status = snapshot.child('status').value as int;
                    final seat = Seat(
                      id: id,
                      name: name,
                      code: code,
                      status: status,
                    );
                    return SeatItemDriver(
                      seat: seat,
                      onTapConfirm: () {},
                      onTapCancel: () {},
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
