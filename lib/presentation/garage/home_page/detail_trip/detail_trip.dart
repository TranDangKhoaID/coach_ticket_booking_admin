import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';

class DetailTripScreen extends StatefulWidget {
  final Trip trip;
  const DetailTripScreen({
    super.key,
    required this.trip,
  });

  @override
  State<DetailTripScreen> createState() => _DetailTripScreenState();
}

class _DetailTripScreenState extends State<DetailTripScreen> {
  DatabaseReference db = FirebaseDatabase.instance.ref();
  String departure = 'Loading...';
  String destination = 'Loading...';
  String driverName = 'Loading...';
  String driverEmail = 'Loading...';
  String driverPhone = 'Loading...';
  String carName = 'Loading...';
  String carlicensePlates = 'Loading...';
  @override
  void initState() {
    super.initState();
    fetchLocation();
    fetchDriver();
    fetchCar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: const Text('Thông tin chuyến'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              color: AppColor.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thông tin tài xế',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Họ tên',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        driverName,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ChangeDriverWidget(
                                idDriver: widget.trip.driverId,
                                idTrip: widget.trip.id,
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Số điện thoại',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        driverPhone,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        driverEmail,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              color: AppColor.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thông tin chi tiết',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Giờ xuất phát',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.trip.departureTime,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Địa điểm',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            departure,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Icon(Icons.arrow_right),
                          Text(
                            destination,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Thời gian',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.trip.departureDate,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tên xe',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        carName.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Biển số xe',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        carlicensePlates,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    color: AppColor.white,
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Giá vé',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${widget.trip.price} đ',
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchCar() async {
    try {
      DataSnapshot snapshotName =
          await db.child('cars').child(widget.trip.carId).child('name').get();
      DataSnapshot snapshotLicensePlates = await db
          .child('cars')
          .child(widget.trip.carId)
          .child('licensePlates')
          .get();

      if (mounted) {
        carName = snapshotName.value.toString();
        carlicensePlates = snapshotLicensePlates.value.toString();
        setState(() {});
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> fetchDriver() async {
    try {
      DataSnapshot snapshotName = await db
          .child('drivers')
          .child(widget.trip.driverId)
          .child('fullName')
          .get();
      DataSnapshot snapshotEmail = await db
          .child('drivers')
          .child(widget.trip.driverId)
          .child('email')
          .get();
      DataSnapshot snapshotPhone = await db
          .child('drivers')
          .child(widget.trip.driverId)
          .child('phone')
          .get();
      if (mounted) {
        driverName = snapshotName.value.toString();
        driverEmail = snapshotEmail.value.toString();
        driverPhone = snapshotPhone.value.toString();
        setState(() {});
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

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
}

class ChangeDriverWidget extends StatelessWidget {
  final String idDriver;
  final String idTrip;
  ChangeDriverWidget({
    super.key,
    required this.idDriver,
    required this.idTrip,
  });

  @override
  Widget build(BuildContext context) {
    DatabaseReference db = FirebaseDatabase.instance.ref();
    return Scaffold(
      body: FirebaseAnimatedList(
        defaultChild: const Center(
          child: CircularProgressIndicator(),
        ),
        query: db.child('drivers'),
        itemBuilder: (context, snapshot, animation, index) {
          String id = snapshot.child('id').value.toString();
          String email = snapshot.child('email').value.toString();
          String fullName = snapshot.child('fullName').value.toString();
          String phone = snapshot.child('phone').value.toString();
          String drivingLicense =
              snapshot.child('drivingLicense').value.toString();
          String image = snapshot.child('image').value.toString();
          String imageFrontID = snapshot.child('imageFrontID').value.toString();
          String imageBackSideID =
              snapshot.child('imageBackSideID').value.toString();
          String status = snapshot.child('status').value.toString();
          final driver = Driver(
            id: id,
            fullName: fullName,
            email: email,
            phone: phone,
            drivingLicense: drivingLicense,
            image: image,
            imageFrontID: imageFrontID,
            imageBackSideID: imageBackSideID,
            status: int.parse(status),
          );
          if (driver.status == 0) {
            return ChangeDriverItemWidget(
              driver: driver,
              onPressed: () {
                DialogHelper.showConfirmDialog(
                  context: context,
                  onPressConfirm: () {
                    AddTripController.instance.changeDriver(
                      idUser: idDriver,
                      idTrip: idTrip,
                      idUserChange: driver.id,
                    );
                  },
                  message: 'Xác nhận đổi tài xế?',
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class ChangeDriverItemWidget extends StatelessWidget {
  final Driver driver;
  final void Function()? onPressed;
  const ChangeDriverItemWidget({
    super.key,
    required this.driver,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(driver.fullName),
      subtitle: Text(driver.phone),
      trailing: IconButton(
        onPressed: () {},
        icon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.task_alt,
          ),
          color: Colors.green,
        ),
      ),
    );
  }
}
