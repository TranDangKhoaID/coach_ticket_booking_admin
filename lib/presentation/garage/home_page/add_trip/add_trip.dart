import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/component/add_trip_car.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/component/add_trip_driver.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/component/bottom_navigation_button.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/add_trip/controller/add_trip_controller.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/location/location_depart_screeen.dart';
import 'package:tdc_coach_admin/presentation/garage/home_page/location/location_des_screen.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({super.key});

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  final price = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
        child: SingleChildScrollView(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Điểm đi',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => LocationDepartScreen());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 3,
                            color: AppColor.primary,
                          ),
                        ),
                        child: Obx(() {
                          return Text(
                            AddTripController.instance.departLocation.value,
                            style: TextStyle(
                              color: AppColor.primary,
                              fontSize: 16,
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Điểm đến',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => LocationDesScreen());
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 3,
                              color: AppColor.primary,
                            ),
                          ),
                          child: Obx(
                            () {
                              return Text(
                                AddTripController.instance.desLocation.value,
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 16,
                                ),
                              );
                            },
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thời gian đi',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Obx(() {
                        final selectedTime =
                            AddTripController.instance.selectedDepartTime.value;
                        int minute = selectedTime.minute;
                        final formattedMinute =
                            minute < 10 ? '0$minute' : '$minute';
                        final formattedTime =
                            '${selectedTime.hour}:$formattedMinute';

                        return Text(
                          formattedTime,
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // Hiển thị time picker và lưu giờ đã chọn vào biến selectedTime
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: AddTripController
                                .instance.selectedDepartTime.value,
                          );
                          if (pickedTime != null) {
                            AddTripController
                                .instance.selectedDepartTime.value = pickedTime;
                          }
                        },
                        child: Icon(
                          Icons.settings,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thời gian đến',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Obx(() {
                        final selectedTime =
                            AddTripController.instance.selectedDesTime.value;
                        final formattedTime =
                            '${selectedTime.hour}:${selectedTime.minute}';
                        return Text(
                          formattedTime,
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // Hiển thị time picker và lưu giờ đã chọn vào biến selectedTime
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: AddTripController
                                .instance.selectedDesTime.value,
                          );

                          if (pickedTime != null) {
                            AddTripController.instance.selectedDesTime.value =
                                pickedTime;
                          }
                        },
                        child: Icon(
                          Icons.settings,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Giá',
                      style: TextStyle(color: AppColor.white, fontSize: 17),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.white,
                        ),
                      ),
                      child: TextField(
                        controller: price,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Tài xế',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => AddTripDriver());
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Obx(
                          () => Text(
                            AddTripController.instance.driverName.value,
                            style: TextStyle(
                              fontSize: 17,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Xe',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => AddTripCar());
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Obx(
                          () => Text(
                            AddTripController.instance.carName.value,
                            style: TextStyle(
                              fontSize: 17,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavButton(
        onTap: () {
          AddTripController.instance.addTrip(price: price.text.trim());
        },
      ),
    );
  }
}
