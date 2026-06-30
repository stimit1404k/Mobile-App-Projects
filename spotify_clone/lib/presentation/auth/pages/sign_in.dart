import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.spotifyLogo, height: 32, width: 32),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 64),
              // _fullNameField(context),
              const SizedBox(height: 24),
              _emailField(context),
              const SizedBox(height: 24),
              _passwordField(context),
              const SizedBox(height: 48),
              BasicAppButton(onPressed: () {}, title: 'Sign In'),
              const SizedBox(height: 200),
              _signInText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      textAlign: TextAlign.center,
    );
  }

  // Widget _fullNameField(BuildContext context) {
  //   return TextField(
  //     decoration: InputDecoration(
  //       hintText: 'Full Name',
  //     ).applyDefaults(Theme.of(context).inputDecorationTheme),
  //   );
  // }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Username or Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signInText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not a member?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SignUp()),
              );
            },
            child: Text(
              'Register Now',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
