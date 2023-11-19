import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/driver/history_trip/history_trip.dart';
import 'package:tdc_coach_admin/presentation/driver/home_page/home_driver_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/drivers/driver_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/trips/home_page_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/location/location_screen.dart';
import 'package:tdc_coach_admin/presentation/garage/top_up/top_up_screen.dart';

class MainDriverScreen extends StatefulWidget {
  const MainDriverScreen({super.key});

  @override
  State<MainDriverScreen> createState() => _MainDriverScreenState();
}

class _MainDriverScreenState extends State<MainDriverScreen> {
  final items = const [
    Icon(
      Icons.home,
      color: AppColor.white,
    ),
    Icon(
      Icons.history,
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
        widget = HomeDriverScreen();
        break;
      case 1:
        widget = HistoryTrip();
        break;
    }
    return widget;
  }
}
