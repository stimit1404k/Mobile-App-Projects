import 'package:flutter/material.dart';
import 'package:zoom_clone_firebase/resources/auth_methods.dart';
import 'package:zoom_clone_firebase/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start or Join a Meeting',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 32),
            child: Image.asset('assets/images/onBoarding.jpg'),
          ),

          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              bool result = await _authMethods.signInWithGoogle(context);
              if (result) {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
