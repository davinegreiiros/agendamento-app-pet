import 'package:agendamento_pet_app/core/di/dependency_injection.dart';
import 'package:agendamento_pet_app/features/auth/presentation/pages/login_page.dart';
import 'package:agendamento_pet_app/main_navigation.dart';
import 'package:agendamento_pet_app/shared/constants/app_routes.dart';
import 'package:flutter/material.dart';

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjection.setupBlocProviders(
        child: MaterialApp(
          title: 'Agenda Pet Saúde',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.login,
          routes: {
            AppRoutes.login: (_) => const LoginPage(),
            AppRoutes.main: (_) => const MainNavigation(),
          },
        ),
      );
}
