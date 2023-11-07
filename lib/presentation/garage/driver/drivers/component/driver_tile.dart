import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';

class DriverTile extends StatelessWidget {
  final Driver driver;
  const DriverTile({
    super.key,
    required this.driver,
  });

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
          child: Text(driver.fullName),
        ),
        subtitle: Text(driver.phone),
        leading: Container(
          width: 50,
          height: double.infinity,
          // ignore: unnecessary_null_comparison
          child: const Icon(
            Icons.person,
            size: 50,
          ),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
