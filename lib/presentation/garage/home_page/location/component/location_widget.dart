import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  const LocationWidget({
    super.key,
    required this.name,
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
                name,
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
