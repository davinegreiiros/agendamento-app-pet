// ignore: prefer_relative_imports
import 'package:flutter/material.dart';
// ignore: prefer_relative_imports
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/pet_flow/core_widgets/pet_scaffold.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_state.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/shared/constants/app_routes.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/core/constants/app_constants.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return PetScaffold(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  _buildHeader(context),
                  const SizedBox(height: AppSpacing.sm),
                  _buildUserProfile(context, state),
                  const SizedBox(height: AppSpacing.xl),
                  _buildPetsSection(context),
                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.menu, size: 28),
        onSelected: (value) {
          if (value == 'logout') {
            context.read<AuthBloc>().add(const SignOutRequested());
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
            );
          }
        },
        itemBuilder: (context) => const [
          PopupMenuItem(
            value: 'logout',
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context, AuthState state) {
    return Column(
      children: [
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primaryLight,
            child: Icon(Icons.person, color: AppColors.textPrimary, size: 48),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          state is AuthAuthenticated ? state.user.name : 'Usuário',
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          state is AuthAuthenticated ? state.user.email : 'email@exemplo.com',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildPetsSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Seus Pets',
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Ver tudo',
                  style: TextStyle(color: AppColors.textPrimary)),
            )
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _buildPetsGrid(context),
      ],
    );
  }

  Widget _buildPetsGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _petPill(
                background: AppColors.primaryLighter,
                imageAsset: 'assets/image/foto-pet1.png',
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _petPill(
                background: AppColors.secondary,
                imageAsset: 'assets/image/foto-pet2.png',
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          children: [
            Expanded(
              child: _petInfoCard(
                context,
                name: 'Aurora',
                breed: 'Golden Retriver',
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _petInfoCard(
                context,
                name: 'Nina',
                breed: 'Pastor Alemão',
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Pill com foto do pet e menu de três pontos
  Widget _petPill({required Color background, required String imageAsset}) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppBorderRadius.pill),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageAsset,
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.more_vert, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  // Card com nome e raça do pet
  Widget _petInfoCard(BuildContext context,
      {required String name, required String breed}) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        border: Border.all(
            color: AppColors.textSecondary.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            breed,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
