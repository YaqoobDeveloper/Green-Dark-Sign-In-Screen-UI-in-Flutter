import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/evergreen_colors.dart';

/// Full-width green gradient button with a soft glow, like "Sign In".
class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 58,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [EvergreenColors.buttonLight, EvergreenColors.buttonDark],
            ),
            boxShadow: [
              BoxShadow(
                color: EvergreenColors.accent.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: EvergreenColors.onAccent,
            ),
          ),
        ),
      ),
    );
  }
}
