import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/evergreen_colors.dart';

/// "Sign in / Sign up" title: the active page in large bold text, a slash,
/// then the other page as a smaller tappable link.
class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.alternate,
    required this.onAlternateTap,
  });

  final String title;
  final String alternate;
  final VoidCallback onAlternateTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
            color: EvergreenColors.text,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '/',
            style: GoogleFonts.inter(
              fontSize: 20,
              color: EvergreenColors.muted,
            ),
          ),
        ),
        // Flexible so the link shrinks instead of overflowing on narrow screens.
        Flexible(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onAlternateTap,
              child: Text(
                alternate,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: EvergreenColors.text.withValues(alpha: 0.9),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
