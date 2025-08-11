import 'package:flutter/material.dart';
import 'core/theme/pet_theme.dart';
import 'pet_flow/onboarding/onboarding_page.dart';
import 'pet_flow/auth/login_page.dart';
import 'main_navigation.dart';

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda Pet Saúde',
      debugShowCheckedModeBanner: false,
      theme: PetTheme.lightTheme,
      initialRoute: OnboardingPage.route,
      routes: {
        OnboardingPage.route: (_) => const OnboardingPage(),
        LoginPage.route: (_) => const LoginPage(),
        '/main': (_) => const MainNavigation(),
      },
    );
  }
}
