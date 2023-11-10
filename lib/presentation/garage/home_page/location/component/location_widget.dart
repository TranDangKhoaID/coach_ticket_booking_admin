import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/domain/model/location.dart';

class LocationWidget extends StatelessWidget {
  final Location location;
  final void Function()? onTap;
  const LocationWidget({
    super.key,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                location.name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
