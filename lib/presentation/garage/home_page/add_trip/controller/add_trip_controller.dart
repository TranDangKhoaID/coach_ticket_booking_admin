import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_admin/domain/model/trip.dart';

class AddTripController extends GetxController {
  static AddTripController get instance => Get.find();
  final database = FirebaseDatabase.instance.ref();
  // Biến để lưu giá trị ngày đã chọn
  var selectedDate = DateTime.now().obs;
  // Biến để lưu giá trị giờ đã chọn
  var selectedDepartTime = TimeOfDay.now().obs;
  var selectedDesTime = TimeOfDay.now().obs;

  var departLocation = 'Điểm đi'.obs;
  var desLocation = 'Điểm đến'.obs;
  // Biến để lưu tài xế
  var driverName = 'Chọn tài xế'.obs;
  var driverId = ''.obs;
  // Biến để lưu xe
  var carName = 'Chọn xe'.obs;
  var carId = ''.obs;
  // Hàm để lấy dữ liệu từ Firebase

  // Hàm để chọn địa điểm
  void selectDepartLocation(String location) {
    departLocation.value = location;
    Get.back(); // Để trở về màn hình trước
  }

  void selectDesLocation(String location) {
    desLocation.value = location;
    Get.back();
  }

  // Hàm để lấy tài xế
  void selectDriver(String name, String id) {
    driverName.value = name;
    driverId.value = id;
    Get.back();
  }

  // Hàm để lấy xe
  void selectCar(String name, String id) {
    carName.value = name;
    carId.value = id;
    Get.back();
  }

  //thêm chuyến
  Future<void> addTrip({required String price}) async {
    EasyLoading.show(status: 'Đang tải...');
    final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate.value);
    //depart time
    final selectDepartTime = selectedDepartTime.value;
    int minuteDepart = selectDepartTime.minute;
    final departMinute = minuteDepart < 10 ? '0$minuteDepart' : '$minuteDepart';
    final formattedDepartTime = '${selectDepartTime.hour}:$departMinute';
    //des time
    final selectDesTime = selectedDesTime.value;
    int minuteDes = selectDepartTime.minute;
    final desMinute = minuteDes < 10 ? '0$minuteDes' : '$minuteDes';
    final formattedDesTime = '${selectDesTime.hour}:$desMinute';
    if (driverId.value.isEmpty) {
      EasyLoading.showError('Lỗi chọn tài xế');
      return;
    }
    if (carId.value.isEmpty) {
      EasyLoading.showError('Lỗi chọn xe');
      return;
    }
    if (departLocation.value == 'Điểm đi') {
      EasyLoading.showError('Lỗi chọn điểm đi');
      return;
    }
    if (desLocation.value == 'Điểm đến') {
      EasyLoading.showError('Lỗi chọn điểm đi');
      return;
    }
    if (price.isEmpty ||
        int.tryParse(price) == null ||
        (int.parse(price) <= 0 || int.parse(price) >= 1000000000)) {
      EasyLoading.showError('Lỗi chọn giá tiền');
      return;
    }
    try {
      String idTrip = 'trip${database.child('trips').push().key}';
      final trip = Trip(
        id: idTrip,
        departureDate: formattedDate,
        departureLocation: departLocation.value,
        destinationLocation: desLocation.value,
        departureTime: formattedDepartTime,
        destinationTime: formattedDesTime,
        price: int.parse(price),
        driverId: driverId.value,
        carId: carId.value,
      );
      await database.child('trips').child(idTrip).set(trip.toJson());
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Thành công!');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
