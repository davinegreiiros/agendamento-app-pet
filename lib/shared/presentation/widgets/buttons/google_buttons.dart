import 'package:flutter/material.dart';
import 'social_button_base.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.size = 48,
  });

  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SocialButton(
      iconPath: 'assets/icons/social/google.svg',
      onPressed: onPressed,
      backgroundColor: Colors.white,
      size: size,
    );
  }
}

class GoogleSignInExtendedButton extends StatelessWidget {
  const GoogleSignInExtendedButton({
    super.key,
    required this.onPressed,
    this.text = 'Entrar com Google',
    this.backgroundColor = const Color(0xFFBFE9E5),
    this.textColor = const Color(0xFF2F4A46),
  });

  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SocialExtendedButton(
      onPressed: onPressed,
      text: text,
      iconPath: 'assets/icons/social/google.svg',
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}
