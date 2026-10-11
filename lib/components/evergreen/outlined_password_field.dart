import 'package:flutter/material.dart';

import 'outlined_field.dart';

/// [OutlinedField] with an eye icon that shows / hides the password.
class OutlinedPasswordField extends StatefulWidget {
  const OutlinedPasswordField({
    super.key,
    required this.controller,
    this.label = 'Password',
    this.hint = 'Enter your password',
    this.onSubmitted,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  @override
  State<OutlinedPasswordField> createState() => _OutlinedPasswordFieldState();
}

class _OutlinedPasswordFieldState extends State<OutlinedPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return OutlinedField(
      controller: widget.controller,
      label: widget.label,
      hint: widget.hint,
      obscureText: _obscure,
      textInputAction: TextInputAction.done,
      onSubmitted: widget.onSubmitted,
      validator: widget.validator,
      suffix: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 20,
        ),
      ),
    );
  }
}
