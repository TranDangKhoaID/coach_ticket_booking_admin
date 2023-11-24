import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:tdc_coach_admin/domain/model/seat.dart';

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
      DataSnapshot cn = await db.child('cars').child(carID).child('name').get();
      if (cn.value.toString().endsWith('LIMOUSINE')) {
        await addSeatFromCar(idCar: carID, seatCount: 15);
      } else if (cn.value.toString().endsWith('COACHES')) {
        await addSeatFromCar(idCar: carID, seatCount: 10);
      } else {
        await addSeatFromCar(idCar: carID, seatCount: 12);
      }
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Xác nhận chuyến thành công');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> addSeatFromCar({
    required String idCar,
    required int seatCount,
  }) async {
    if (idCar.isEmpty) {
      return;
    }
    try {
      // Tạo danh sách ghế
      List<Seat> seats = [];
      for (int i = 1; i <= seatCount; i++) {
        String idSeat = 'seat$i';
        Set<int> usedCodes = <int>{};
        int uniqueRandomCode = generateUniqueRandomSeatCode(usedCodes);
        final seat = Seat(
          id: idSeat, // Tạo id ghế theo số thứ tự
          name: 'A$i', // Tạo tên ghế theo số thứ tự
          code: uniqueRandomCode, // Mã code tùy ý
          status: 0, // Trạng thái tùy ý
          userPhone: '',
          userID: '',
        );
        seats.add(seat);
      }

      // Thêm từng ghế vào cơ sở dữ liệu
      for (Seat seat in seats) {
        await db.child('seats').child(idCar).child(seat.id).set(seat.toJson());
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  int generateUniqueRandomSeatCode(Set<int> usedCodes) {
    final random = Random();
    const maxNumber = 9999999;
    const minNumber = 1000000;

    int randomNumber;

    do {
      randomNumber = minNumber + random.nextInt(maxNumber - minNumber);
    } while (usedCodes.contains(randomNumber));

    usedCodes.add(randomNumber);
    return randomNumber;
  }
}
