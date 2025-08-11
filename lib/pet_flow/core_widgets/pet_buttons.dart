import 'package:flutter/material.dart';

class PetPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const PetPrimaryButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF6B46C1);
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: purple,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.2),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          elevation: 0,
        ),
        child: Text(label),
      ),
    );
  }
}

class PetSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const PetSecondaryButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF6B46C1);
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: purple,
          backgroundColor: Colors.white,
          side: const BorderSide(color: purple, width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.2),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
        child: Text(label),
      ),
    );
  }
}
