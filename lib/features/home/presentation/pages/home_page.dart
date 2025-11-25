import 'package:agendamento_pet_app/core/constants/app_constants.dart';

import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: AppSpacing.xl),
                Expanded(
                  child: _buildDashboardGrid(context),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildHeader(BuildContext context) => BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final userName =
              state is AuthAuthenticated ? state.user.name : 'Davi Negreiros';

          return Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.pets,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá, $userName 👋',
                      style: AppTextStyles.headlineSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Como está seu pet hoje?',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Navigate to notifications
                },
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 28,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          );
        },
      );

  Widget _buildDashboardGrid(BuildContext context) => GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
        childAspectRatio: 1.1,
        children: [
          _buildDashboardCard(
            context,
            title: 'Meus Pets',
            subtitle: 'Gerenciar pets',
            icon: Icons.pets,
            color: AppColors.primary,
            onTap: () {
              // TODO: Navigate to pets list
            },
          ),
          _buildDashboardCard(
            context,
            title: 'Consultas',
            subtitle: 'Agendar consulta',
            icon: Icons.calendar_today_outlined,
            color: const Color(0xFFFF9800),
            onTap: () {
              // TODO: Navigate to appointments
            },
          ),
          _buildDashboardCard(
            context,
            title: 'Vacinas',
            subtitle: 'Cartão de vacina',
            icon: Icons.card_membership_outlined,
            color: AppColors.secondary,
            onTap: () {
              // TODO: Navigate to vaccines
            },
          ),
          _buildDashboardCard(
            context,
            title: 'Exames',
            subtitle: 'Ver exames',
            icon: Icons.medical_services_outlined,
            color: const Color(0xFF4CAF50),
            onTap: () {
              // TODO: Navigate to exams
            },
          ),
        ],
      );

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) =>
      Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.1),
                  color.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(AppBorderRadius.lg),
              border: Border.all(
                color: color.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppBorderRadius.md),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 28,
                  ),
                ),
                const Spacer(),
                Text(
                  title,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
