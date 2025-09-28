import 'package:flutter/material.dart';
import 'social_button_base.dart';

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton({
    super.key,
    required this.onPressed,
    this.size = 48,
  });

  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SocialButton(
      iconPath: 'assets/icons/social/facebook.svg',
      onPressed: onPressed,
      backgroundColor: Colors.white,
      size: size,
    );
  }
}

class FacebookSignInExtendedButton extends StatelessWidget {
  const FacebookSignInExtendedButton({
    super.key,
    required this.onPressed,
    this.text = 'Entrar com Facebook',
    this.backgroundColor = Colors.white,
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
      iconPath: 'assets/icons/social/facebook.svg',
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}
