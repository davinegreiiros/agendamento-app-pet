// ignore_for_file: prefer_relative_imports
import 'package:agendamento_pet_app/core/constants/app_constants.dart';
import 'package:agendamento_pet_app/core/validators/validators.dart';
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:agendamento_pet_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:agendamento_pet_app/features/auth/presentation/widgets/custom_text_field.dart';

import 'package:agendamento_pet_app/shared/constants/app_routes.dart';
import 'package:agendamento_pet_app/shared/presentation/widgets/buttons/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String route = AppRoutes.login;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleGoogleSignIn(BuildContext context) {
    context.read<AuthBloc>().add(const SignInWithGoogleRequested());
  }

  void _handleAppleSignIn(BuildContext context) {
    // TODO(davii): implementar login com Apple
  }

  void _handleEmailSignIn(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
            SignInWithEmailRequested(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  void _handleSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.register);
  }

  void _handleForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPassword);
  }

  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthAuthenticated) {
            Navigator.pushReplacementNamed(context, AppRoutes.main);
          }
        },
        child: AuthScaffold(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(context),
                const SizedBox(height: AppSpacing.xl),
                _buildEmailForm(context),
                const SizedBox(height: AppSpacing.xl),
                _buildActionButtons(context),
                const SizedBox(height: AppSpacing.lg),
                _buildEmailDivider(context),
                const SizedBox(height: AppSpacing.lg),
                _buildSocialButtons(context),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      );

  Widget _buildHeader(BuildContext context) => Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.pets,
              size: 36,
              color: AppColors.textPrimary.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Center(
            child: Text(
              'Agenda\nPet\nSaúde',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineLarge.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      );

  Widget _buildSocialButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Google
          GestureDetector(
            onTap: () => _handleGoogleSignIn(context),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'G',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [
                          Color(0xFF4285F4),
                          Color(0xFF34A853),
                          Color(0xFFFBBC05),
                          Color(0xFFEA4335),
                        ],
                      ).createShader(
                        const Rect.fromLTWH(0, 0, 24, 24),
                      ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Apple
          GestureDetector(
            onTap: () => _handleAppleSignIn(context),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.apple,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildEmailDivider(BuildContext context) => Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Acessar com conta',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      );

  Widget _buildEmailForm(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: _emailController,
              labelText: 'E-mail',
              hintText: 'Digite seu e-mail',
              keyboardType: TextInputType.emailAddress,
              validator: Validators.validateEmail,
              suffixIcon: const Icon(
                Icons.check,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Senha',
              hintText: '••••••••',
              obscureText: true,
              validator: Validators.validatePassword,
              suffixIcon: TextButton(
                onPressed: () => _handleForgotPassword(context),
                child: const Text(
                  'Esqueceu?',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildActionButtons(BuildContext context) =>
      BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  text: 'Iniciar',
                  onPressed:
                      isLoading ? null : () => _handleEmailSignIn(context),
                  isLoading: isLoading,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: double.infinity,
                child: SecondaryButton(
                  text: 'Cadastrar',
                  onPressed: isLoading ? null : () => _handleSignUp(context),
                ),
              ),
            ],
          );
        },
      );
}
