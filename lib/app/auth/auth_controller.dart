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

      final DataSnapshot snapshot =
          await databaseReference.child("garage").child('email').get();
      String emailGarageDB = snapshot.value.toString();
      if (userCredential.user != null) {
        if (userType.value == '0') {
          if (email == emailGarageDB) {
            //isLoggedIn.value = true;
            //AppPreferences.instance.saveOptionIsLoggedIn(0);
            EasyLoading.dismiss();
          } else {
            auth.signOut();
            EasyLoading.dismiss();
            EasyLoading.showError('Lỗi phân quyền');
            return;
            //isLoggedIn.value = false;
          }
        } else {
          final DataSnapshot snapshot = await databaseReference
              .child('drivers')
              .child(auth.currentUser!.uid)
              .child('email')
              .get();
          if (snapshot.value == email) {
            //AppPreferences.instance.saveOptionIsLoggedIn(1);
            //isLoggedIn.value = true;
            EasyLoading.dismiss();
          } else {
            //isLoggedIn.value = false;
            await auth.signOut();
            EasyLoading.showError('Bạn không phải tài xế');
            EasyLoading.dismiss();
            return;
          }
        }
      } else {
        await auth.signOut();
        EasyLoading.dismiss();
        return;
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      //await auth.signOut();
      //isLoggedIn.value = false;
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  void logout() {
    // Thực hiện đăng xuất và cập nhật trạng thái đăng nhập
    auth.signOut();
    //AppPreferences.instance.logout();
    userType.value = '0';
    //isLoggedIn.value = false;
  }
}
