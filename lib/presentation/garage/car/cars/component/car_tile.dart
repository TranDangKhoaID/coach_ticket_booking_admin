import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/car.dart';

class CarTile extends StatelessWidget {
  final Car car;
  const CarTile({super.key, required this.car});

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
          child: Text(car.name),
        ),
        subtitle: Text(car.licensePlates),
        leading: Container(
          width: 50,
          height: double.infinity,
          child: car.image.isEmpty
              ? Image.asset(ImageConstants.carIcon)
              : Image.network(car.image),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
