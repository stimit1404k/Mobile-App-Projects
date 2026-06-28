import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_form_validation/palette.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;

  const SocialButton({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: TextButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset(iconPath, width: 22, color: Palette.whiteColor),
        label: Text(
          label,
          style: const TextStyle(
            color: Palette.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          backgroundColor: Palette.surfaceColor.withValues(alpha: 0.35),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Palette.borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
