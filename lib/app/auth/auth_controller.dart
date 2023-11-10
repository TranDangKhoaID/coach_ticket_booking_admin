import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

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
    EasyLoading.show(status: 'Đang tải...');
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Kiểm tra xem đăng nhập thành công
      if (userCredential.user != null) {
        final DataSnapshot snapshot =
            await databaseReference.child("garage").child('email').get();
        String emailGarageDB = snapshot.value.toString();
        if (userType.value == '0') {
          if (email == emailGarageDB) {
            isLoggedIn.value = true;
            EasyLoading.dismiss();
          } else {
            EasyLoading.dismiss();
            EasyLoading.showError('Lỗi phân quyền');
            isLoggedIn.value = false;
          }
        } else {
          final DataSnapshot snapshot = await databaseReference
              .child('drivers')
              .child(userCredential.user!.uid)
              .child('email')
              .get();
          if (snapshot.value == email) {
            isLoggedIn.value = true;
            EasyLoading.dismiss();
          } else {
            isLoggedIn.value = false;
            EasyLoading.showError('Bạn không phải tài xế');
            EasyLoading.dismiss();
          }
        }
      } else {
        isLoggedIn.value = false;
        EasyLoading.dismiss();
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
    //AppPreferences.instance.logout();
    userType.value = '0';
    isLoggedIn.value = false;
  }
}
