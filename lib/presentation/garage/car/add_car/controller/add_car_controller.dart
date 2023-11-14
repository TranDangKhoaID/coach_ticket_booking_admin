import 'dart:io';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tdc_coach_admin/domain/model/car.dart';
import 'package:tdc_coach_admin/domain/model/seat.dart';

class AddCarController extends GetxController {
  static AddCarController get instance => Get.find();
  final databaseReference = FirebaseDatabase.instance.ref();

  final storage = FirebaseStorage.instance.ref();

  final ImagePicker _imagePicker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);
  String imgUrl = '';
  var dropDownvalue = 'limousine'.obs;

  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      dropDownvalue.value = selectedValue;
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      //print('Ảnh${image.value}');
    }
  }

  Future<void> addCarFireBaseDatabase({
    required String licensePlates,
  }) async {
    EasyLoading.show(status: 'Đang tải...');
    if (image.value == null) {
      EasyLoading.dismiss();
      EasyLoading.showError('Vui lòng chọn ảnh!');
      return;
    }
    String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final storageDirImage = storage.child('cars');
    final storageImageToUpLoad = storageDirImage.child(uniqueFileName);
    //store the file
    try {
      await storageImageToUpLoad.putFile(File(image.value!.path));
      imgUrl = await storageImageToUpLoad.getDownloadURL();
      String idCar = 'car${databaseReference.child('cars').push().key}';
      final car = Car(
        id: idCar,
        name: dropDownvalue.value.toUpperCase(),
        licensePlates: licensePlates,
        image: imgUrl,
        status: 0,
      );
      await databaseReference.child('cars').child(idCar).set(car.toJson());
      if (dropDownvalue.value.endsWith('limousine')) {
        await addSeatFromCar(idCar: idCar, seatCount: 15);
      } else if (dropDownvalue.value.endsWith('coaches')) {
        await addSeatFromCar(idCar: idCar, seatCount: 10);
      } else {
        await addSeatFromCar(idCar: idCar, seatCount: 12);
      }
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Thành công!');
      Get.back();
      //print('Link ảnh: $imgUrl');
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
        );
        seats.add(seat);
      }

      // Thêm từng ghế vào cơ sở dữ liệu
      for (Seat seat in seats) {
        await databaseReference
            .child('seats')
            .child(idCar)
            .child(seat.id)
            .set(seat.toJson());
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
