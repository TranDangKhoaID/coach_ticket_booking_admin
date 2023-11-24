import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/seat.dart';
import 'package:tdc_coach_admin/presentation/detail_seat_driver/controller/detail_seat_controller.dart';
import 'package:tdc_coach_admin/presentation/driver/component/seat_item_driver.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/detail_driver/controller/detail_driver_controller.dart';

class DetailSeatDriverTrip extends StatefulWidget {
  final String tripID;
  final String carID;
  const DetailSeatDriverTrip({
    super.key,
    required this.carID,
    required this.tripID,
  });

  @override
  State<DetailSeatDriverTrip> createState() => _DetailSeatDriverTripState();
}

class _DetailSeatDriverTripState extends State<DetailSeatDriverTrip> {
  DatabaseReference databse = FirebaseDatabase.instance.ref();
  late DatabaseReference dbSeat;

  @override
  void initState() {
    super.initState();
    dbSeat = databse.child('trips').child(widget.tripID).child('seats');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        appBar: AppBar(
          title: Text('Chi tiết ghế'),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.primary[400],
            borderRadius: BorderRadius.circular(5),
          ),
          child: FirebaseAnimatedList(
            defaultChild: const Center(
              child: CircularProgressIndicator(),
            ),
            query: dbSeat,
            itemBuilder: (context, snapshot, animation, index) {
              String id = snapshot.child('id').value.toString();
              int code = snapshot.child('code').value as int;
              String name = snapshot.child('name').value.toString();
              String userID = snapshot.child('userID').value.toString();
              String userPhone = snapshot.child('userPhone').value.toString();
              int status = snapshot.child('status').value as int;
              final seat = Seat(
                id: id,
                name: name,
                code: code,
                status: status,
                userID: userID,
                userPhone: userPhone,
              );

              return SeatItemDriver(
                seat: seat,
                onTapConfirm: () {},
                onTapCancel: () {},
              );
            },
          ),
        ));
  }
}
