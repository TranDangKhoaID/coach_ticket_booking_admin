import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';

class DriverTile extends StatelessWidget {
  final Driver driver;
  final void Function()? onTap;
  const DriverTile({
    super.key,
    required this.driver,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
        leading: SizedBox(
          width: 50,
          height: double.infinity,
          // ignore: unnecessary_null_comparison
          child: driver.image.isEmpty
              ? const Icon(
                  Icons.person,
                  size: 50,
                )
              : Image.network(
                  driver.image,
                  fit: BoxFit.cover,
                ),
        ),
        trailing: GestureDetector(
          onTap: onTap,
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
