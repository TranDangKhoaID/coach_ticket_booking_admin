import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';

class TripItem extends StatefulWidget {
  final Trip trip;
  final void Function()? onTap;
  const TripItem({
    super.key,
    required this.onTap,
    required this.trip,
  });

  @override
  State<TripItem> createState() => _TripItemState();
}

class _TripItemState extends State<TripItem> {
  DatabaseReference db = FirebaseDatabase.instance.ref();
  String departure = 'Loading...';
  String destination = 'Loading...';
  Future<void> fetchLocation() async {
    try {
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
      departure = snapshotDepart.value.toString();
      destination = snapshotDes.value.toString();
      if (mounted) {
        setState(() {
          departure = snapshotDepart.value.toString();
          destination = snapshotDes.value.toString();
        });
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.primary[300],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.trip.departureTime,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Icon(Icons.arrow_forward),
                      ),
                      Text(
                        widget.trip.destinationTime,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${widget.trip.price} đ',
                          style: const TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          ' - ',
                          style: TextStyle(
                            color: AppColor.white,
                          ),
                        ),
                        Text(
                          widget.trip.departureDate,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle_notifications),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        departure,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    alignment: Alignment.centerLeft,
                    height: 50,
                    child: const DottedLine(
                      direction: Axis.vertical,
                      dashColor: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        destination,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: AppColor.primary[400],
        ),
      ],
    );
  }
}
