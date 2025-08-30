import 'package:flutter/material.dart';
import 'google_buttons.dart';
import 'facebook_buttons.dart';

/// Widget que exibe uma linha com botões de redes sociais
class SocialButtonsRow extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;
  final double buttonSize;
  final double spacing;

  const SocialButtonsRow({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
    this.buttonSize = 48,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GoogleSignInButton(
          onPressed: onGooglePressed,
          size: buttonSize,
        ),
        SizedBox(width: spacing),
        FacebookSignInButton(
          onPressed: onFacebookPressed,
          size: buttonSize,
        ),
      ],
    );
  }
}

/// Widget que exibe botões estendidos de redes sociais em coluna
class SocialExtendedButtonsColumn extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;
  final double spacing;
  final String googleText;
  final String facebookText;

  const SocialExtendedButtonsColumn({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
    this.spacing = 16,
    this.googleText = 'Entrar com Google',
    this.facebookText = 'Entrar com Facebook',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GoogleSignInExtendedButton(
          onPressed: onGooglePressed,
          text: googleText,
        ),
        SizedBox(height: spacing),
        FacebookSignInExtendedButton(
          onPressed: onFacebookPressed,
          text: facebookText,
        ),
      ],
    );
  }
}
