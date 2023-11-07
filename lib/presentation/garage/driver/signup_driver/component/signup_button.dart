import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class BTNSignUpDriverWidget extends StatelessWidget {
  final void Function()? onTap;
  const BTNSignUpDriverWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.primary[700],
        ),
        child: Text(
          'Tạo',
          style: TextStyle(
            color: AppColor.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
