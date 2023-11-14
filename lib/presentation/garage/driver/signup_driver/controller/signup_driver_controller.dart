import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';

class SignupDriverController extends GetxController {
  static SignupDriverController instance = Get.find();
  //email, password, name...
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref();
  //fire base storage
  final storage = FirebaseStorage.instance.ref();
  //
  final ImagePicker _imagePicker = ImagePicker();
  Rx<File?> imageFrontID = Rx<File?>(null);
  Rx<File?> imageBackSide = Rx<File?>(null);
  String imgUrlFrontID = '';
  String imgUrlBackSide = '';

  Future<void> pickImageFrontID() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageFrontID.value = File(pickedFile.path);
      //print('Ảnh${image.value}');
    }
  }

  Future<void> pickImageBackSideID() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageBackSide.value = File(pickedFile.path);
      //print('Ảnh${image.value}');
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String drivingLicense,
  }) async {
    EasyLoading.show(status: 'Đang tải');
    try {
      if (email.isEmpty ||
          password.isEmpty ||
          fullName.isEmpty ||
          phone.isEmpty ||
          drivingLicense.isEmpty) {
        EasyLoading.dismiss();
        EasyLoading.showError('Vui lòng nhập đầy đủ các trường!');
        return;
      }
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String idDriver = userCredential.user!.uid;
      final driver = Driver(
        id: idDriver,
        fullName: fullName,
        email: email,
        phone: phone,
        drivingLicense: drivingLicense,
        image: "",
        status: 0,
      );
      await databaseReference
          .child('drivers')
          .child(idDriver)
          .set(driver.toJson());
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Tạo tài khoản thành công');
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.toString(); // Extract error message from Firebase
      EasyLoading.dismiss();
      EasyLoading.showError(errorMessage);
    }
  }
}
