import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Botão base para redes sociais (circular)
class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final bool isCircular;

  const SocialButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.size = 48,
    this.isCircular = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: backgroundColor,
        shape: isCircular
            ? const CircleBorder()
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        child: InkWell(
          onTap: onPressed,
          customBorder: isCircular
              ? const CircleBorder()
              : RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: size * 0.5,
              height: size * 0.5,
              colorFilter: iconColor != Colors.black
                  ? ColorFilter.mode(iconColor, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

/// Botão estendido base para redes sociais
class SocialExtendedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String iconPath;
  final Color backgroundColor;
  final Color textColor;

  const SocialExtendedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconPath,
    this.backgroundColor = Colors.white,
    this.textColor = const Color(0xFF2F4A46),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 64),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 10),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconPath,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
