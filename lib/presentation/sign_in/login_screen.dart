import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_coach_admin/app/manager/color_manager.dart';
import 'package:tdc_coach_admin/presentation/home_page_garage/home_garage_screen.dart';
import 'package:tdc_coach_admin/presentation/sign_in/component/header_img_widget.dart';
import 'package:tdc_coach_admin/presentation/sign_in/component/text_field.dart';
import 'package:tdc_coach_admin/app/auth/auth_controller.dart';
import 'package:tdc_coach_admin/presentation/sign_in/list_options.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderImageWidget(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextFieldSignIn(
                    email: email,
                    password: password,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text('Nhà xe'),
                          leading: Radio(
                            value: options[0],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                                AuthController.instance
                                    .setUserType(value.toString());
                                print(AuthController.instance.userType.value);
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text('Tài xế'),
                          leading: Radio(
                            value: options[1],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                                AuthController.instance
                                    .setUserType(value.toString());
                                print(AuthController.instance.userType.value);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.login(
                        email.text.trim(),
                        password.text.trim(),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
