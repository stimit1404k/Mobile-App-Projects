import 'package:flutter/material.dart';
import 'package:login_form_validation/login_screen.dart';
import 'package:login_form_validation/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Palette.backGroundColor,
      ),
      home: const LoginScreen(),
    );
  }
}
