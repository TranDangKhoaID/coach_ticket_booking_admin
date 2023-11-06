import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class CarTile extends StatelessWidget {
  const CarTile({super.key});

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
          child: Text('Lumindis'),
        ),
        subtitle: Text('54-V79061'),
        leading: Container(
          width: 50,
          height: double.infinity,
          child: Image.asset(ImageConstants.light1Login),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
