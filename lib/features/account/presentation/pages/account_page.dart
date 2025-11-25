// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/core/constants/app_constants.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_event.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_state.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_event.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_state.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/shared/constants/app_routes.dart';
// ignore: prefer_relative_imports
import 'package:flutter/material.dart';
// ignore: prefer_relative_imports
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    _loadPets();
  }

  void _loadPets() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<PetBloc>().add(LoadPets(authState.user.id));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                _buildHeader(context),
                const SizedBox(height: AppSpacing.md),
                _buildUserProfile(context),
                const SizedBox(height: AppSpacing.xl),
                _buildPetsSection(context),
              ],
            ),
          ),
        ),
      );

  Widget _buildHeader(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: PopupMenuButton<String>(
          icon: const Icon(Icons.menu, size: 28, color: AppColors.textPrimary),
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
              child: Row(
                children: [
                  Icon(Icons.logout, color: AppColors.error),
                  SizedBox(width: AppSpacing.sm),
                  Text('Sair'),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildUserProfile(BuildContext context) =>
      BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                  width: 3,
                ),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primaryLight,
                child: Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: 48,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              state is AuthAuthenticated ? state.user.name : 'Usuário',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineSmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              state is AuthAuthenticated
                  ? state.user.email
                  : 'email@exemplo.com',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );

  Widget _buildPetsSection(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Meus Pets',
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  // TODO: Navigate to pets list
                },
                icon: const Icon(Icons.pets, size: 18),
                label: const Text('Ver todos'),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          BlocBuilder<PetBloc, PetState>(
            builder: (context, state) {
              if (state is PetLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSpacing.xl),
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                );
              }

              if (state is PetError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: AppColors.error,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          state.message,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.error,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (state is PetsLoaded) {
                if (state.pets.isEmpty) {
                  return _buildEmptyPetsCard(context);
                }

                return Column(
                  children: [
                    ...state.pets.take(2).map((pet) => _buildPetCard(pet)),
                    if (state.pets.length > 2)
                      Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.sm),
                        child: Text(
                          '+${state.pets.length - 2} pets',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      );

  Widget _buildEmptyPetsCard(BuildContext context) => Container(
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
          border: Border.all(
            color: AppColors.textSecondary.withOpacity(0.2),
          ),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.pets,
              size: 48,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Nenhum pet cadastrado',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to create pet
              },
              icon: const Icon(Icons.add),
              label: const Text('Adicionar Pet'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      );

  Widget _buildPetCard(Pet pet) => Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
          border: Border.all(
            color: AppColors.textSecondary.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.primaryLight,
              child: Icon(
                Icons.pets,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    pet.breed,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // TODO: Navigate to pet details
              },
              icon: const Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
}
