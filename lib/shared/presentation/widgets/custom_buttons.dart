import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.height = 64,
    this.borderRadius = 40,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBackgroundColor = backgroundColor ?? const Color(0xFFBFE9E5);
    final defaultTextColor = textColor ?? const Color(0xFF2C2C2C);

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: defaultBackgroundColor,
          foregroundColor: defaultTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          elevation: 0,
          padding: padding,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(defaultTextColor),
                ),
              )
            : Text(text),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.height = 64,
    this.borderRadius = 40,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBackgroundColor = backgroundColor ?? const Color(0xFFBDBDBD);
    final defaultTextColor = textColor ?? const Color(0xFF2C2C2C);

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: defaultBackgroundColor,
          foregroundColor: defaultTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          elevation: 0,
          padding: padding,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(defaultTextColor),
                ),
              )
            : Text(text),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;

  const OutlineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.height = 64,
    this.borderRadius = 40,
    this.borderWidth = 2,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorderColor = borderColor ?? const Color(0xFFBFE9E5);
    final defaultTextColor = textColor ?? const Color(0xFF2C2C2C);
    final defaultBackgroundColor = backgroundColor ?? Colors.transparent;

    return SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: defaultBackgroundColor,
          foregroundColor: defaultTextColor,
          side: BorderSide(
            color: defaultBorderColor,
            width: borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          padding: padding,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(defaultTextColor),
                ),
              )
            : Text(text),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double iconSize;
  final bool isCircular;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = 48,
    this.iconSize = 24,
    this.isCircular = true,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBackgroundColor = backgroundColor ?? Colors.white;
    final defaultIconColor = iconColor ?? const Color(0xFF2C2C2C);

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: defaultBackgroundColor,
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
            child: Icon(
              icon,
              color: defaultIconColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
