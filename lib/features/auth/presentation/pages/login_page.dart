// ignore_for_file: prefer_relative_imports
import 'package:agendamento_pet_app/core/constants/app_constants.dart';
import 'package:agendamento_pet_app/core/validators/validators.dart';
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';
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

  void _handleFacebookSignIn(BuildContext context) {
    context.read<AuthBloc>().add(const SignInWithFacebookRequested());
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
                _buildSocialButtons(context),
                const SizedBox(height: AppSpacing.lg),
                _buildEmailDivider(context),
                const SizedBox(height: AppSpacing.lg),
                _buildEmailForm(context),
                const SizedBox(height: AppSpacing.xl),
                _buildActionButtons(context),
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
              color: AppColors.textPrimaryWithOpacity(0.85),
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

  Widget _buildSocialButtons(BuildContext context) => Column(
        children: [
          GoogleSignInExtendedButton(
            onPressed: () => _handleGoogleSignIn(context),
          ),
          const SizedBox(height: AppSpacing.md),
          FacebookSignInExtendedButton(
            onPressed: () => _handleFacebookSignIn(context),
            backgroundColor: AppColors.primaryLight,
          ),
        ],
      );

  Widget _buildEmailDivider(BuildContext context) => Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              'Ou com e-mail',
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
              PrimaryButton(
                text: 'Iniciar',
                onPressed: isLoading ? null : () => _handleEmailSignIn(context),
                isLoading: isLoading,
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                text: 'Cadastrar',
                onPressed: isLoading ? null : () => _handleSignUp(context),
              ),
            ],
          );
        },
      );
}
