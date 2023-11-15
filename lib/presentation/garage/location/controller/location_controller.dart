import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/domain/model/location.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  DatabaseReference db = FirebaseDatabase.instance.ref();

  Future<void> addLocation({
    required String name,
    required String address,
  }) async {
    EasyLoading.show();
    try {
      if (name.isEmpty || address.isEmpty) {
        EasyLoading.dismiss();
        EasyLoading.showError(
          'Không được bỏ trống trường nào!',
          dismissOnTap: true,
        );
        return;
      }
      String idLocation = 'location${db.child('locations').push().key}';
      final location = Location(id: idLocation, name: name, address: address);
      await db.child('locations').child(idLocation).set(location.toJson());
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Thêm thành công!');
      Get.back();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
