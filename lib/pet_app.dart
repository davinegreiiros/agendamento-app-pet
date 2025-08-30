import 'package:flutter/material.dart';
import 'shared/presentation/theme/app_theme.dart';
import 'pet_flow/onboarding/onboarding_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'main_navigation.dart';

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda Pet Saúde',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: OnboardingPage.route,
      routes: {
        OnboardingPage.route: (_) => const OnboardingPage(),
        LoginPage.route: (_) => const LoginPage(),
        '/main': (_) => const MainNavigation(),
      },
    );
  }
}
