import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class AddTrip extends StatelessWidget {
  const AddTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary[400],
      appBar: AppBar(
        title: Text('Thêm chuyến'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text('Thêm chuyến'),
      ),
      bottomNavigationBar: Container(
        height: 60,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          'Thêm',
          style: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
