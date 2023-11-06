import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(child: Text('Diver')),
    );
  }
}
