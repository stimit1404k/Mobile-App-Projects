import 'package:flutter/material.dart';
import 'package:login_form_validation/palette.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const GradientButton({
    super.key,
    required this.onPressed,
    this.label = 'Sign In',
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Palette.gradient1, Palette.gradient2, Palette.gradient3],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Palette.whiteColor,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Palette.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
