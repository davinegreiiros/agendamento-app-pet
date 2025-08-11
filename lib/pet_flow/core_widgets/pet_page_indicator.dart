import 'package:flutter/material.dart';

class PetPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int length;
  const PetPageIndicator({super.key, required this.currentIndex, required this.length});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (i) {
        final active = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: active ? 24 : 8,
          decoration: BoxDecoration(
            color: active ? Theme.of(context).colorScheme.primary : Colors.black12,
            borderRadius: BorderRadius.circular(6),
          ),
        );
      }),
    );
  }
}

