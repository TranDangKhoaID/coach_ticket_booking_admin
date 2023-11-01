import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/app/storage/app_shared.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  //email, password, name...
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref();
  //
  var isLoggedIn = false.obs;
  var userType = '0'.obs;

  //set user type
  void setUserType(String type) {
    userType.value = type;
  }

  Future<void> login(String email, String password) async {
    EasyLoading.show(status: 'Đang tải');
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Kiểm tra xem đăng nhập thành công
      if (userCredential.user != null) {
        DataSnapshot dataSnapshot =
            await databaseReference.child("garage").child('email').get();
        String emailGarageDB = dataSnapshot.value.toString();
        if (userType.value == '0') {
          if (email == emailGarageDB) {
            // AppPreferences.instance.setIsLoggedIn();
            // AppPreferences.instance.saveOptionIsLoggedIn(0);
            print('Chuẩn gmail nhà xe');
            isLoggedIn.value = true;
            EasyLoading.dismiss();
          } else {
            EasyLoading.dismiss();
            EasyLoading.showError('Lỗi phân quyền');
            isLoggedIn.value = false;
          }
        } else {
          // AppPreferences.instance.setIsLoggedIn();
          // AppPreferences.instance.saveOptionIsLoggedIn(1);
          print('Chuẩn gmail tài xế');
          isLoggedIn.value = true;
          EasyLoading.dismiss();
        }
      } else {
        isLoggedIn.value = false;
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      isLoggedIn.value = false;
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  void logout() {
    // Thực hiện đăng xuất và cập nhật trạng thái đăng nhập
    auth.signOut();
    AppPreferences.instance.logout();
    isLoggedIn.value = false;
  }

  void registerDriver(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        'About User',
        'Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Tạo tài khoản thất bại',
          style: TextStyle(
            color: AppColor.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: AppColor.white,
          ),
        ),
      );
    }
  }
}
