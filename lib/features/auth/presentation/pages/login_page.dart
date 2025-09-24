import 'package:flutter/material.dart';
import '../../../../shared/presentation/widgets/buttons/index.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_scaffold.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleGoogleSignIn() {
    // TODO: Implementar login com Google
    debugPrint('Google Sign In pressed');
  }

  void _handleFacebookSignIn() {
    // TODO: Implementar login com Facebook
    debugPrint('Facebook Sign In pressed');
  }

  void _handleEmailSignIn() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      // TODO: Implementar login com email
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isLoading = false);
          Navigator.pushReplacementNamed(context, '/main');
        }
      });
    }
  }

  void _handleSignUp() {
    // TODO: Navegar para tela de cadastro
    debugPrint('Sign Up pressed');
  }

  void _handleForgotPassword() {
    // TODO: Implementar recuperação de senha
    debugPrint('Forgot Password pressed');
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ícone topo esquerdo (pata)
            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.pets,
                size: 36,
                color: const Color(0xFF2C2C2C).withValues(alpha: 0.85),
              ),
            ),
            const SizedBox(height: 8),

            // Título em 3 linhas
            Center(
              child: Text(
                'Agenda\nPet\nSaúde',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF2F4A46),
                      fontSize: 44,
                      height: 1.05,
                      letterSpacing: -0.5,
                    ),
              ),
            ),

            const SizedBox(height: 32),

            // Botão Google estendido
            GoogleSignInExtendedButton(
              onPressed: _handleGoogleSignIn,
              text: 'Entrar com Google',
              backgroundColor: const Color(0xFFBFE9E5),
              textColor: const Color(0xFF2F4A46),
            ),

            const SizedBox(height: 16),

            // Botão Facebook estendido
            FacebookSignInExtendedButton(
              onPressed: _handleFacebookSignIn,
              backgroundColor: const Color(0xFFBFE9E5),
              textColor: const Color(0xFF2F4A46),
              text: 'Entrar com Facebook',
            ),

            const SizedBox(height: 24),

            // Divisor "Ou com e-mail"
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Ou com e-mail',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF2F4A46),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 24),

            // Formulário
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                    labelText: 'E-mail',
                    hintText: 'Digite seu e-mail',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite seu e-mail';
                      }
                      if (!value.contains('@')) {
                        return 'Digite um e-mail válido';
                      }
                      return null;
                    },
                    suffixIcon: const Icon(
                      Icons.check,
                      color: Color(0xFFA5D9D3),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: 'Senha',
                    hintText: '••••••••',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite sua senha';
                      }
                      if (value.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                    suffixIcon: TextButton(
                      onPressed: _handleForgotPassword,
                      child: const Text(
                        'Esqueceu?',
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Botão Iniciar
            PrimaryButton(
              text: 'Iniciar',
              onPressed: _handleEmailSignIn,
              isLoading: _isLoading,
            ),

            const SizedBox(height: 16),

            // Botão Cadastrar
            SecondaryButton(
              text: 'Cadastrar',
              onPressed: _handleSignUp,
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
