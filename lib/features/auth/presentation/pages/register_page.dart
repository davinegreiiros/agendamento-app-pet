import 'package:agendamento_pet_app/shared/constants/app_routes.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String route = AppRoutes.register;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: const Center(
          child: Text('Tela de cadastro — em construção'),
        ),
      );
}
