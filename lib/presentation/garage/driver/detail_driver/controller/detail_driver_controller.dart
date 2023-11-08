import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailDriverController extends GetxController {
  static DetailDriverController get instance => Get.find();
  final databaseReference = FirebaseDatabase.instance.ref();

  final storage = FirebaseStorage.instance.ref();

  final ImagePicker _imagePicker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);
  String imgUrl = '';

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      //print('Ảnh${image.value}');
    }
  }

  Future<void> addImageDriver(
    String idDriver,
  ) async {
    EasyLoading.show(status: 'Đang tải');
    if (image.value == null) {
      EasyLoading.dismiss();
      EasyLoading.showError('Vui lòng chọn ảnh!');
      return;
    }
    String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final storageDirImage = storage.child('drivers');
    final storageImageToUpLoad = storageDirImage.child(uniqueFileName);
    //store the file
    try {
      await storageImageToUpLoad.putFile(File(image.value!.path));
      imgUrl = await storageImageToUpLoad.getDownloadURL();
      await databaseReference
          .child('drivers')
          .child(idDriver)
          .update({'image': imgUrl});
      EasyLoading.dismiss();
      EasyLoading.showSuccess('Thành công!');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
