import 'package:agendamento_pet_app/shared/constants/app_routes.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static const String route = AppRoutes.forgotPassword;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Esqueci minha senha')),
        body: const Center(
          child: Text('Tela de recuperação de senha — em construção'),
        ),
      );
}
