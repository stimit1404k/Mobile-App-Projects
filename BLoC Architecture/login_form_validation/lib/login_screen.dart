import 'package:flutter/material.dart';
import 'package:login_form_validation/widgets/gradient_button.dart';
import 'package:login_form_validation/widgets/login_field.dart';
import 'package:login_form_validation/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign-In.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
              const SizedBox(height: 50),
              const SocialButton(
                iconPath: 'assets/svgs/f_logo.svg',
                label: 'Continue with FaceBook',
                horizontalPadding: 90,
              ),
              const SizedBox(height: 16),
              const SocialButton(
                iconPath: 'assets/svgs/g_logo.svg',
                label: 'Continue with Google',
                horizontalPadding: 90,
              ),
              const SizedBox(height: 16),
              const Text('or', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              LoginField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 16),
              LoginField(hintText: 'Password', controller: passwordController),
              const SizedBox(height: 24),
              const GradientButton(),
            ],
          ),
        ),
      ),
    );
  }
}
