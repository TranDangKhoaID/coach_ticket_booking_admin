import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';

class SignupDriverController extends GetxController {
  static SignupDriverController instance = Get.find();
  //email, password, name...
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref();

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
