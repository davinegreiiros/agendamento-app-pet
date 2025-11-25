import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_bloc.dart';
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_event.dart';
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_state.dart';
import 'package:agendamento_pet_app/shared/presentation/theme/app_border_radius.dart';
import 'package:agendamento_pet_app/shared/presentation/theme/app_colors.dart';
import 'package:agendamento_pet_app/shared/presentation/theme/app_spacing.dart';
import 'package:agendamento_pet_app/shared/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsListPage extends StatefulWidget {
  const PetsListPage({super.key});

  @override
  State<PetsListPage> createState() => _PetsListPageState();
}

class _PetsListPageState extends State<PetsListPage> {
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
        appBar: AppBar(
          title: const Text('Meus Pets'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<PetBloc, PetState>(
          builder: (context, state) {
            if (state is PetLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }

            if (state is PetError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: AppColors.error,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      state.message,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    ElevatedButton(
                      onPressed: _loadPets,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Tentar novamente'),
                    ),
                  ],
                ),
              );
            }

            if (state is PetsLoaded) {
              if (state.pets.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.pets,
                        size: 64,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        'Você ainda não tem pets cadastrados',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async => _loadPets(),
                color: AppColors.primary,
                child: ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  itemCount: state.pets.length,
                  itemBuilder: (context, index) =>
                      _buildPetCard(state.pets[index]),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Navigate to create pet page
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      );

  Widget _buildPetCard(Pet pet) => Card(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        ),
        child: InkWell(
          onTap: () {
            // TODO: Navigate to pet details
          },
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: _getPetTypeColor(pet.type),
                  child: Icon(
                    _getPetTypeIcon(pet.type),
                    size: 32,
                    color: Colors.white,
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
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        pet.ageDescription,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      );

  Color _getPetTypeColor(PetType type) {
    switch (type) {
      case PetType.dog:
        return AppColors.primary;
      case PetType.cat:
        return AppColors.secondary;
      case PetType.bird:
        return const Color(0xFF4CAF50);
      case PetType.fish:
        return const Color(0xFF2196F3);
      case PetType.other:
        return AppColors.textSecondary;
    }
  }

  IconData _getPetTypeIcon(PetType type) {
    switch (type) {
      case PetType.dog:
      case PetType.cat:
      case PetType.bird:
      case PetType.fish:
      case PetType.other:
        return Icons.pets;
    }
  }
}
