import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/detail_trip/detail_trip.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/trips/component/trip_item.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text('Danh sách chuyến'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TripItem(
              onTap: () {
                Get.to(() => DetailTripScreen());
              },
            ),
            TripItem(
              onTap: () {},
            ),
            TripItem(
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
