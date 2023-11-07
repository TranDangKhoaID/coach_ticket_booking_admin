import 'package:flutter/material.dart';
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
              BTNSignUpDriverWidget(
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
            ],
          ),
        ),
      ),
    );
  }
}
