import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';

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
  String carName = 'Loading...';
  String carLis = 'Loading...';
  DatabaseReference db = FirebaseDatabase.instance.ref();
  //
  Future<void> fetchLocation() async {
    DataSnapshot snapshotDepart = await db
        .child('locations')
        .child(widget.trip.departureLocation)
        .child('address')
        .get();
    DataSnapshot snapshotDes = await db
        .child('locations')
        .child(widget.trip.destinationLocation)
        .child('address')
        .get();
    if (mounted) {
      departure = snapshotDepart.value.toString();
      destination = snapshotDes.value.toString();
      setState(() {});
    }
  }

  Future<void> fetchCar() async {
    DataSnapshot snapshotDepart =
        await db.child('cars').child(widget.trip.carId).child('name').get();
    DataSnapshot snapshotDes = await db
        .child('cars')
        .child(widget.trip.carId)
        .child('licensePlates')
        .get();
    if (mounted) {
      carName = snapshotDepart.value.toString();
      carLis = snapshotDes.value.toString();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
    fetchCar();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primary[400],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thông tin chuyến',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mã chuyến',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.trip.id,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ngày xuất phát',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.trip.departureDate,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Giờ xuất phát',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.trip.departureTime,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Điểm đi',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      departure,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Điểm đến',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      destination,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primary[400],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thông tin xe',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mã xe',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.trip.carId,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tên xe',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      carName,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biển số',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      carLis,
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primary[400],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(15),
                child: Text(
                  'Chi tiết ghế',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          GestureDetector(
            onTap: widget.onTapConfirm,
            child: IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primary[400],
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(15),
                child: Text(
                  'Xác nhận hoàn thành chuyến',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
