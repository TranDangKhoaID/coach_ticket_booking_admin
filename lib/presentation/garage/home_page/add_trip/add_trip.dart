import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/component/bottom_navigation_button.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';

class AddTrip extends StatelessWidget {
  const AddTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary[400],
      appBar: AppBar(
        title: Text('Thêm chuyến'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ngày xuất phát',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Obx(() {
                      final selectedDate =
                          AddTripController.instance.selectedDate.value;
                      final formattedDate =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                      return Text(
                        formattedDate,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                        ),
                      );
                    }),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // Hiển thị date picker và lưu ngày đã chọn vào biến selectedDate
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              AddTripController.instance.selectedDate.value,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2030),
                        );
                        if (pickedDate != null) {
                          AddTripController.instance.selectedDate.value =
                              pickedDate;
                        }
                      },
                      child: Icon(
                        Icons.date_range,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavButton(
        onTap: () {
          print(AddTripController.instance.selectedDate.value);
        },
      ),
    );
  }
}
