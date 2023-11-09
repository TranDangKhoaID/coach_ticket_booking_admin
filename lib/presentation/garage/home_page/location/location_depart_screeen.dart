import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/location/component/location_widget.dart';

class LocationDepartScreen extends StatelessWidget {
  const LocationDepartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Chọn địa điểm'),
        backgroundColor: AppColor.primary,
      ),
      body: Column(
        children: [
          LocationWidget(
            name: 'TP Hồ Chí Minh',
            onTap: () {
              AddTripController.instance.selectDepartLocation('TP Hồ Chí Minh');
            },
          ),
          LocationWidget(
            name: 'Huế',
            onTap: () {
              AddTripController.instance.selectDepartLocation('Huế');
            },
          ),
          LocationWidget(
            name: 'Hà Nội',
            onTap: () {
              AddTripController.instance.selectDepartLocation('Hà Nội');
            },
          ),
        ],
      ),
    );
  }
}
