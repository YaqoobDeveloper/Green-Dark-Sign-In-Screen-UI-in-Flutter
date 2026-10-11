import 'package:flutter/material.dart';

import '../../theme/evergreen_colors.dart';

/// Round, outlined icon button, used for the back arrow and social logins.
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 44,
  });

  final Widget icon;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.04),
            border: Border.all(color: EvergreenColors.outline, width: 1.2),
          ),
          child: icon,
        ),
      ),
    );
  }
}
