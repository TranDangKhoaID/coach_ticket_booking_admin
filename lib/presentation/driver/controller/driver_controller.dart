import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DriverController extends GetxController {
  static DriverController get instance => Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;

  var carID = ''.obs;
}
