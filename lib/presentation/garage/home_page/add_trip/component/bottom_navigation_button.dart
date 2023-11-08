import 'package:flutter/widgets.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class BottomNavButton extends StatelessWidget {
  final void Function()? onTap;
  const BottomNavButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
