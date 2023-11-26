import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';

class TopUpController extends GetxController {
  static TopUpController get instance => Get.find();
  //firebase
  DatabaseReference db = FirebaseDatabase.instance.ref();
  Future<void> addMoneyInWallerUser({
    required String userID,
    required String topUpID,
    required int money,
  }) async {
    EasyLoading.show(status: 'Đang xử lí...');
    try {
      DataSnapshot snapshotMoney =
          await db.child('customers').child(userID).child('wallet').get();
      final wallet = snapshotMoney.value as int;
      final updateWallet = wallet + money;
      await db
          .child('customers')
          .child(userID)
          .update({'wallet': updateWallet});
      await db.child('top_ups').child(topUpID).update({'status': 1});
      EasyLoading.dismiss();
      EasyLoading.showError('Nạp thành công!');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> cancelTopUP({
    required String topUpID,
  }) async {
    EasyLoading.show(status: 'Đang xử lí');
    try {
      await db.child('top_ups').child(topUpID).update({'status': 2});
      EasyLoading.dismiss();
      EasyLoading.showError('Hủy thành công!');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
