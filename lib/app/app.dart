import 'package:flutter/material.dart';
import 'package:tdc_coach_admin/presentation/sign_in/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
    );
  }
}
