import 'package:flutter/material.dart';
import 'package:login_form_validation/palette.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Palette.gradient1, Palette.gradient2, Palette.gradient3],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),

        borderRadius: BorderRadius.circular(8),
      ),

      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),

        child: const Text(
          'Sign-In',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
