import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/car/cars/car_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/drivers/driver_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/trips/home_page_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/location/location_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/top_up/top_up_screen.dart';

class MainGarageScreen extends StatefulWidget {
  const MainGarageScreen({super.key});

  @override
  State<MainGarageScreen> createState() => _MainGarageScreenState();
}

class _MainGarageScreenState extends State<MainGarageScreen> {
  final items = const [
    Icon(
      Icons.home,
      color: AppColor.white,
    ),
    Icon(
      Icons.car_repair,
      color: AppColor.white,
    ),
    Icon(
      Icons.person,
      color: AppColor.white,
    ),
    Icon(
      Icons.attach_money,
      color: AppColor.white,
    ),
    Icon(
      Icons.location_city,
      color: AppColor.white,
    ),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: getSelectedWidget(index: index),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        backgroundColor: AppColor.primary,
        color: AppColor.primary.shade200,
        animationDuration: Duration(milliseconds: 300),
        items: items,
        index: index,
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    late Widget widget;
    switch (index) {
      case 0:
        widget = HomePageScreen();
        break;
      case 1:
        widget = CarScreen();
        break;
      case 2:
        widget = DriverScreen();
        break;
      case 3:
        widget = const TopUpScreen();
        break;
      case 4:
        widget = LocationScreen();
        break;
      default:
    }
    return widget;
  }
}
