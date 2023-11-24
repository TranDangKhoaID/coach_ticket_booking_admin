import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

class DriverController extends GetxController {
  static DriverController get instance => Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference db = FirebaseDatabase.instance.ref();

  Future<void> confirmTrip(
      {required String userID,
      required String tripID,
      required String carID}) async {
    EasyLoading.show();
    try {
      await db.child('trips').child(tripID).update({'status': 1});
      await db.child('drivers').child(userID).update({'status': 0});
      await db.child('cars').child(carID).update({'status': 0});
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Xác nhận chuyến thành công');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
