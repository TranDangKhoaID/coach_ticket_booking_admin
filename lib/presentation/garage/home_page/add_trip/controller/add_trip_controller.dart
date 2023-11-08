import 'package:get/get.dart';

class AddTripController extends GetxController {
  static AddTripController get instance => Get.find();
  // Biến để lưu giá trị ngày đã chọn
  var selectedDate = DateTime.now().obs;
}
