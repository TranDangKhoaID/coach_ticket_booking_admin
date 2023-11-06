import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/component/signup_button.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/signup_driver/component/text_field.dart';

class SignUpDriver extends StatelessWidget {
  const SignUpDriver({super.key});

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
              TFSignUpDriverWidget(),
              BTNSignUpDriverWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
