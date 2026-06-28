import 'package:flutter/material.dart';
import 'package:weather_app/theme/app_palette.dart';

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: AppPalette.indigo),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: AppPalette.indigo.withOpacity(0.7),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppPalette.indigo,
          ),
        ),
      ],
    );
  }
}

