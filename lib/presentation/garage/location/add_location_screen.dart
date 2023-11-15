import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/app/constants/image_constants.dart';
import 'package:tdc_coach_admin/app/helpers/dialog_helper.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/garage/location/controller/location_controller.dart';

class AddLocationScreen extends StatelessWidget {
  AddLocationScreen({super.key});
  final name = TextEditingController();
  final address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: const Text('Thêm địa điểm'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 180,
                  child: Image.asset(
                    ImageConstants.locationIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Tên tỉnh: ',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.white,
                        ),
                      ),
                      child: TextField(
                        controller: name,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Điểm lên xe: ',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.white,
                        ),
                      ),
                      child: TextField(
                        controller: address,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  DialogHelper.showConfirmDialog(
                    context: context,
                    onPressConfirm: () {
                      LocationController.instance.addLocation(
                        name: name.text,
                        address: address.text,
                      );
                    },
                    message: 'Xác nhận thêm địa điểm ?',
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primary[400],
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: const Text(
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
