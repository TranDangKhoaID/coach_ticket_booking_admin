import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/domain/model/driver.dart';
import 'package:tdc_coach_admin/presentation/garage/driver/detail_driver/controller/detail_driver_controller.dart';

class DetailDriver extends StatelessWidget {
  final Driver driver;
  const DetailDriver({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary[400],
      appBar: AppBar(
        title: Text('Chi tiết tài xế'),
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: DetailDriverController.instance.pickImage,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 180,
                      child: DetailDriverController.instance.image.value == null
                          ? (driver.image.isEmpty)
                              ? (Image.asset(
                                  ImageConstants.driverIcon,
                                  fit: BoxFit.cover,
                                ))
                              : Image.network(
                                  driver.image,
                                  fit: BoxFit.cover,
                                )
                          : Image.file(
                              File(DetailDriverController
                                  .instance.image.value!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Tên',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.white,
                        ),
                      ),
                      child: Text(
                        driver.fullName,
                        style: TextStyle(
                          color: AppColor.white,
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
                      'Số điện thoại',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.white,
                        ),
                      ),
                      child: Text(
                        driver.phone,
                        style: TextStyle(
                          color: AppColor.white,
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
                      'Bằng lái',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.white,
                        ),
                      ),
                      child: Text(
                        driver.drivingLicense,
                        style: TextStyle(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        DetailDriverController.instance
                            .addImageDriver(driver.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.primary,
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Sửa',
                          style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.white,
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Xóa',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
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
                    child: Column(
                      children: [
                        Text(
                          'CCCD Mặt Trước',
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColor.white,
                            ),
                          ),
                          child: Image.network(
                            driver.imageFrontID,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'CCCD Mặt Sau',
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColor.white,
                            ),
                          ),
                          child: Image.network(
                            driver.imageBackSideID,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
