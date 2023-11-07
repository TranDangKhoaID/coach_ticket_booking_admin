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
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
