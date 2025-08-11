import 'package:flutter/material.dart';

class PetScaffold extends StatelessWidget {
  final Widget child;
  const PetScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: child,
    );
  }
}
