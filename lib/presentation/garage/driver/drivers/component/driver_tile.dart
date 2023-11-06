import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class DriverTile extends StatelessWidget {
  const DriverTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.primary[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('Đặng Cao Đại'),
        ),
        subtitle: Text('0902800531'),
        leading: Container(
          width: 50,
          height: double.infinity,
          child: Image.asset(ImageConstants.clockLogin),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
