// ignore: prefer_relative_imports
import 'package:flutter/material.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/shared/presentation/theme/app_theme.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/pet_flow/onboarding/onboarding_page.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/presentation/pages/login_page.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/main_navigation.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/core/di/dependency_injection.dart';

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyInjection.setupBlocProviders(
      child: MaterialApp(
        title: 'Agenda Pet Saúde',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: OnboardingPage.route,
        routes: {
          OnboardingPage.route: (_) => const OnboardingPage(),
          LoginPage.route: (_) => const LoginPage(),
          '/main': (_) => const MainNavigation(),
        },
      ),
    );
  }
}
