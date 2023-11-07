import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/car/add_car/controller/add_car_controller.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final name = TextEditingController();
  final licensePlates = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text('Thêm xe'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () {
                  return GestureDetector(
                    onTap: AddCarController.instance.pickImage,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColor.white,
                          ),
                        ),
                        child: AddCarController.instance.image.value == null
                            ? Image.asset(
                                ImageConstants.addCar,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(AddCarController
                                    .instance.image.value!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Tên xe: ',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.white,
                        ),
                      ),
                      child: TextField(
                        controller: name,
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
                      'Biển số: ',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.white,
                        ),
                      ),
                      child: TextField(
                        controller: licensePlates,
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
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  AddCarController.instance.addCarFireBaseDatabase(
                    name: name.text,
                    licensePlates: licensePlates.text,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primary[400],
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Thêm',
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
