import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class TFSignUpDriverWidget extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController fullName;
  final TextEditingController phone;
  final TextEditingController drivingLicense;
  const TFSignUpDriverWidget({
    super.key,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
    required this.drivingLicense,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColor.white,
            ),
          ),
          child: TextField(
            controller: fullName,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.person,
                color: AppColor.white,
              ),
              labelText: "Họ tên",
              labelStyle: TextStyle(color: AppColor.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColor.white,
            ),
          ),
          child: TextField(
            controller: phone,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.phone,
                color: AppColor.white,
              ),
              labelText: "Số điện thoại",
              labelStyle: TextStyle(color: AppColor.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColor.white,
            ),
          ),
          child: TextField(
            controller: email,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.mail,
                color: AppColor.white,
              ),
              labelText: "Email",
              labelStyle: TextStyle(color: AppColor.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColor.white,
            ),
          ),
          child: TextField(
            obscureText: true,
            controller: password,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.lock,
                color: AppColor.white,
              ),
              labelText: "Mật khẩu",
              labelStyle: TextStyle(color: AppColor.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColor.white,
            ),
          ),
          child: TextField(
            controller: drivingLicense,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.car_repair,
                color: AppColor.white,
              ),
              labelText: "Mã bằng lái",
              labelStyle: TextStyle(color: AppColor.white),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
