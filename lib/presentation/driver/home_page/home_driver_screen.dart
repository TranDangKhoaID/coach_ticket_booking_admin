import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';

class HomeDriverScreen extends StatelessWidget {
  const HomeDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Tài xế'),
        actions: [
          IconButton(
            onPressed: () {
              DialogHelper.showConfirmDialog(
                context: context,
                onPressConfirm: () {
                  AuthController.instance.logout();
                },
                message: 'Đăng xuất ?',
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text('Home Driver'),
      ),
    );
  }
}
