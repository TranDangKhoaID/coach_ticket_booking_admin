import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class AddCar extends StatelessWidget {
  const AddCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text('Thêm xe'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text('Thêm xe'),
      ),
    );
  }
}
