import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';

class HomeGarageScreen extends StatelessWidget {
  const HomeGarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nha xe'),
        actions: [
          GestureDetector(
            onTap: () {
              AuthController.instance.logout();
            },
            child: Container(
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Center(
        child: Text('Home Garage'),
      ),
    );
  }
}
