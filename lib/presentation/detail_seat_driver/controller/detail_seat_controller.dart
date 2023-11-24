import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/domain/model/seat.dart';

class DetailSeatDriverController extends GetxController {
  static DetailSeatDriverController get instance => Get.find();

  DatabaseReference db = FirebaseDatabase.instance.ref();

  Future<void> confirmSeat({
    required String tripID,
    required String carID,
    required String seatID,
    required String userPhone,
    required String userID,
    required int code,
    required int status,
    required String name,
  }) async {
    EasyLoading.show();
    try {
      await db.child('seats').child(carID).child(seatID).update({'status': 2});
      final seat = Seat(id: seatID, name: name, code: code, status: status);
      await db
          .child('trips')
          .child(tripID)
          .child('seats')
          .child(seatID)
          .set(seat.toJson());
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Xác nhận thành công');
      Get.back();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> cancelSeat({
    required carID,
    required seatID,
  }) async {
    EasyLoading.show();
    try {
      await db.child('seats').child(carID).child(seatID).update({'status': 3});
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Hủy thành công');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
