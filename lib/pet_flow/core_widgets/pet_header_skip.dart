import 'package:flutter/material.dart';

class PetHeaderSkip extends StatelessWidget {
  final VoidCallback onSkip;
  const PetHeaderSkip({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('🐾', style: TextStyle(fontSize: 36)),
        TextButton(
          onPressed: onSkip,
          child: const Text(
            'Pular',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
