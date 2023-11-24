import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';
import 'package:tdc_coach_admin/presentation/detail_seat_driver/detail_seat_driver.dart';

class TripItemDriver extends StatefulWidget {
  final Trip trip;
  final void Function()? onTap;
  final void Function()? onTapConfirm;
  const TripItemDriver({
    super.key,
    required this.trip,
    required this.onTap,
    required this.onTapConfirm,
  });

  @override
  State<TripItemDriver> createState() => _TripItemDriverState();
}

class _TripItemDriverState extends State<TripItemDriver> {
  //
  String departure = 'Loading...';
  String destination = 'Loading...';
  DatabaseReference db = FirebaseDatabase.instance.ref();
  //
  Future<void> fetchLocation() async {
    DataSnapshot snapshotDepart = await db
        .child('locations')
        .child(widget.trip.departureLocation)
        .child('name')
        .get();
    DataSnapshot snapshotDes = await db
        .child('locations')
        .child(widget.trip.destinationLocation)
        .child('name')
        .get();
    if (mounted) {
      departure = snapshotDepart.value.toString();
      destination = snapshotDes.value.toString();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                'Giờ xuất bến',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.trip.departureTime,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColor.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.trip.departureDate,
                style: const TextStyle(
                  color: AppColor.white,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            height: 90,
            child: const DottedLine(
              direction: Axis.vertical,
              dashColor: AppColor.secondary,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColor.white,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    departure,
                    style: const TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.circle_notifications,
                    color: AppColor.white,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    destination,
                    style: const TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Chi tiết vé',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: widget.onTapConfirm,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Xác nhận chuyến',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
