import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';

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
  // Biến để lưu danh sách dữ liệu từ Firebase

  // Hàm để lấy dữ liệu từ Firebase

  // Hàm để chọn địa điểm
  void selectDepartLocation(String location) {
    departLocation.value = location;
    Get.back(); // Để trở về màn hình trước
  }

  void selectDesLocation(String location) {
    desLocation.value = location;
    Get.back(); // Để trở về màn hình trước
  }
}
