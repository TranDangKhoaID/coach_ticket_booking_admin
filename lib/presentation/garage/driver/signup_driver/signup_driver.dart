import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/component/signup_button.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/component/text_field.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/controller/signup_driver_controller.dart';

class SignUpDriver extends StatelessWidget {
  SignUpDriver({super.key});
  final email = TextEditingController();
  final fullName = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final drivingLicense = TextEditingController();
  void clearText() {
    email.clear();
    fullName.clear();
    phone.clear();
    password.clear();
    drivingLicense.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary[400],
      appBar: AppBar(
        elevation: 0,
        title: Text('Tạo tài xế'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TFSignUpDriverWidget(
                email: email,
                password: password,
                fullName: fullName,
                phone: phone,
                drivingLicense: drivingLicense,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Mặt trước CCCD',
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: SignupDriverController
                                .instance.pickImageFrontID,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: AppColor.white,
                                ),
                              ),
                              child: SignupDriverController
                                          .instance.imageFrontID.value ==
                                      null
                                  ? Icon(
                                      Icons.camera_alt,
                                      size: 100,
                                      color: AppColor.white,
                                    )
                                  : Image.file(
                                      File(SignupDriverController
                                          .instance.imageFrontID.value!.path),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Mặt sau CCCD',
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColor.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: SignupDriverController
                                .instance.pickImageBackSideID,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: AppColor.white,
                                ),
                              ),
                              child: SignupDriverController
                                          .instance.imageBackSide.value ==
                                      null
                                  ? Icon(
                                      Icons.camera_alt,
                                      size: 100,
                                      color: AppColor.white,
                                    )
                                  : Image.file(
                                      File(SignupDriverController
                                          .instance.imageBackSide.value!.path),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BTNSignUpDriverWidget(
        onTap: () {
          SignupDriverController.instance.signUp(
            email: email.text,
            password: password.text,
            fullName: fullName.text,
            phone: phone.text,
            drivingLicense: drivingLicense.text,
          );
          clearText();
        },
      ),
    );
  }
}
