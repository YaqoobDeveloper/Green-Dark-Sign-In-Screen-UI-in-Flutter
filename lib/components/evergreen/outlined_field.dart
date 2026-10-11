import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/evergreen_colors.dart';

/// Rounded outlined field whose green label sits in a notch of the border.
class OutlinedField extends StatelessWidget {
  const OutlinedField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  static OutlineInputBorder _border(Color color, [double width = 1.2]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      cursorColor: EvergreenColors.accent,
      style: GoogleFonts.inter(fontSize: 15, color: EvergreenColors.text),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: EvergreenColors.accent,
        ),
        floatingLabelStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: EvergreenColors.accent,
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 15,
          color: EvergreenColors.muted.withValues(alpha: 0.75),
        ),
        errorStyle: GoogleFonts.inter(
          fontSize: 12,
          color: EvergreenColors.error,
        ),
        suffixIcon: suffix,
        suffixIconColor: EvergreenColors.muted,
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 16, 18),
        enabledBorder: _border(EvergreenColors.outline),
        focusedBorder: _border(EvergreenColors.accent, 1.5),
        errorBorder: _border(EvergreenColors.error),
        focusedErrorBorder: _border(EvergreenColors.error, 1.5),
      ),
    );
  }
}
