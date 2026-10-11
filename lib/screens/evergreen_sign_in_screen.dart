import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/evergreen/evergreen_components.dart';
import '../theme/evergreen_colors.dart';
import '../utils/validators.dart';

class EvergreenSignInScreen extends StatefulWidget {
  const EvergreenSignInScreen({super.key});

  @override
  State<EvergreenSignInScreen> createState() => _EvergreenSignInScreenState();
}

class _EvergreenSignInScreenState extends State<EvergreenSignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _remember = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void _signIn() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _showMessage('Signed in as ${_emailController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                EvergreenColors.backgroundTop,
                EvergreenColors.backgroundBottom,
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: _buildContent(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CircleIconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 20,
                color: EvergreenColors.text,
              ),
              onTap: () {},
            ),
          ),
          SizedBox(height: 40),
          AuthHeader(
            title: "Sign in",
            alternate: "Sign up",
            onAlternateTap: () {},
          ),
          SizedBox(height: 10),
          Text(
            "Fill the from to sign into account",
            style: GoogleFonts.inter(
              fontSize: 15,
              color: EvergreenColors.text.withValues(alpha: 0.85),
            ),
          ),
          SizedBox(height: 32),
          OutlinedField(
            controller: _emailController,
            label: "Email",
            hint: "Enter your email address",
            validator: Validators.email,
          ),
          SizedBox(height: 20),
          OutlinedPasswordField(
            controller: _passwordController,
            validator: Validators.password,
          ),
          SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot password",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: EvergreenColors.accent,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: LabeledSwitch(
              label: "Remember",
              value: _remember,
              onChanged: (value) {
                setState(() {
                  _remember = value;
                });
              },
            ),
          ),
          SizedBox(height: 28),
          GradientButton(label: "Sign In", onTap: _signIn),
          SizedBox(height: 36),
          UppercaseDivider(label: "Or continue with"),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _social(FontAwesomeIcons.facebookF, "Facebook"),
              SizedBox(width: 24),
              _social(FontAwesomeIcons.instagram, "Instagram"),
              SizedBox(width: 24),
              _social(FontAwesomeIcons.google, "Google"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _social(FaIconData icon, String name) {
    return CircleIconButton(
      size: 52,
      icon: FaIcon(icon, size: 18, color: EvergreenColors.text),
      onTap: () => _showMessage('Continue with $name'),
    );
  }
}
