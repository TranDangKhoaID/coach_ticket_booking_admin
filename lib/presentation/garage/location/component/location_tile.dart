import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/location.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  const LocationTile({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary[400],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          location.name,
          style: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Địa điểm: ${location.address}',
            style: TextStyle(
              color: AppColor.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
