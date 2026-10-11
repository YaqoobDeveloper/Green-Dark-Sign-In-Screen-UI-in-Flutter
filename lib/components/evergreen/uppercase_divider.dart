import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/evergreen_colors.dart';

/// Hairline — UPPERCASE LABEL — hairline.
class UppercaseDivider extends StatelessWidget {
  const UppercaseDivider({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final line = Expanded(
      child: Divider(color: Colors.white.withValues(alpha: 0.15)),
    );

    return Row(
      children: [
        line,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            label.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: EvergreenColors.muted,
            ),
          ),
        ),
        line,
      ],
    );
  }
}
