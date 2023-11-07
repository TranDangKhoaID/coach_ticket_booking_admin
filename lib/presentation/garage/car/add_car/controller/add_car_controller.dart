import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tdc_coach_admin/domain/model/car.dart';

class AddCarController extends GetxController {
  static AddCarController get instance => Get.find();
  final databaseReference = FirebaseDatabase.instance.ref().child('cars');

  final storage = FirebaseStorage.instance.ref();

  final ImagePicker _imagePicker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);
  String imgUrl = '';

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      print('Ảnh${image.value}');
    }
  }

  Future<void> addCarFireBaseDatabase({
    required String name,
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
      String idDriver = 'car${databaseReference.push().key}';
      final car = Car(
        id: idDriver,
        name: name,
        licensePlates: licensePlates,
        image: imgUrl,
      );
      await databaseReference.child(idDriver).set(car.toJson());
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Thành công!');
      print('Link ảnh: $imgUrl');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
