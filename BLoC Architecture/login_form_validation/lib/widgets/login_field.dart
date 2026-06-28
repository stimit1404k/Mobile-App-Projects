import 'package:flutter/material.dart';
import 'package:login_form_validation/palette.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const LoginField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Palette.whiteColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          filled: true,
          fillColor: Palette.surfaceColor.withValues(alpha: 0.45),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.gradient2, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          hintStyle: TextStyle(
            color: Palette.whiteColor.withValues(alpha: 0.75),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
