import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_bloc.dart';
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_event.dart';
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_state.dart';
import 'package:agendamento_pet_app/features/pets/presentation/pages/pet_details_page.dart';
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

  Future<void> _navigateToDetails(Pet pet) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider.value(
          value: context.read<PetBloc>(),
          child: PetDetailsPage(petId: pet.id),
        ),
      ),
    );
    _loadPets();
  }

  void _navigateToAddPet() {
    // TODO(davii): navegar para tela de cadastro de pet
  }

  void _navigateToEditPet(Pet pet) {
    // TODO(davii): navegar para tela de edição do pet
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<PetBloc, PetState>(
            builder: (context, state) {
              if (state is PetLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }

              if (state is PetError) {
                return _buildErrorState(state.message);
              }

              if (state is PetsLoaded) {
                if (state.pets.isEmpty) {
                  return _buildEmptyState();
                }
                return _buildPetsList(state.pets);
              }

              return const SizedBox.shrink();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _navigateToAddPet,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text('Adicionar Pet'),
        ),
      );

  Widget _buildHeader(int petCount) => Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meus Pets',
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              petCount == 1
                  ? '$petCount pet cadastrado'
                  : '$petCount pets cadastrados',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );

  Widget _buildPetsList(List<Pet> pets) => RefreshIndicator(
        onRefresh: () async => _loadPets(),
        color: AppColors.primary,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 80),
          children: [
            _buildHeader(pets.length),
            const SizedBox(height: AppSpacing.sm),
            ...pets.map(_buildPetCard),
          ],
        ),
      );

  Widget _buildPetCard(Pet pet) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.xl),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: InkWell(
          onTap: () => _navigateToDetails(pet),
          borderRadius: BorderRadius.circular(AppBorderRadius.xl),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Imagem do pet
                _buildPetAvatar(pet),
                const SizedBox(width: AppSpacing.md),
                // Info do pet
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pet.name,
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${pet.breed} \u2022 ${pet.ageDescription}',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      // Chips
                      Row(
                        children: [
                          _buildChip(
                            _getPetTypeName(pet.type),
                            _getPetTypeColor(pet.type),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          _buildChip(
                            _getGenderName(pet.gender),
                            pet.gender == PetGender.female
                                ? const Color(0xFFE91E63)
                                : const Color(0xFF2196F3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Ações
                Column(
                  children: [
                    IconButton(
                      onPressed: () => _navigateToEditPet(pet),
                      icon: const Icon(Icons.edit_outlined),
                      color: AppColors.primary,
                      iconSize: 22,
                      tooltip: 'Editar',
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildPetAvatar(Pet pet) => Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _getPetTypeColor(pet.type).withOpacity(0.3),
            width: 3,
          ),
        ),
        child: ClipOval(
          child: pet.imageUrl != null
              ? Image.asset(
                  pet.imageUrl!,
                  width: 68,
                  height: 68,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildDefaultAvatar(pet),
                )
              : _buildDefaultAvatar(pet),
        ),
      );

  Widget _buildDefaultAvatar(Pet pet) => ColoredBox(
        color: _getPetTypeColor(pet.type).withOpacity(0.15),
        child: Icon(
          Icons.pets,
          size: 32,
          color: _getPetTypeColor(pet.type),
        ),
      );

  Widget _buildChip(String label, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppBorderRadius.pill),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      );

  Widget _buildEmptyState() => Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppBorderRadius.xl),
                child: Image.asset(
                  'assets/image/dog-splash-1.png',
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Nenhum pet cadastrado',
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Cadastre seu primeiro pet para\ncomeçar a agendar consultas',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _navigateToAddPet,
                  icon: const Icon(Icons.add),
                  label: const Text('Cadastrar meu pet'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppBorderRadius.pill),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildErrorState(String message) => Center(
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
              message,
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

  Color _getPetTypeColor(PetType type) {
    switch (type) {
      case PetType.dog:
        return AppColors.primary;
      case PetType.cat:
        return const Color(0xFFC9C1F0);
      case PetType.bird:
        return const Color(0xFF4CAF50);
      case PetType.fish:
        return const Color(0xFF2196F3);
      case PetType.other:
        return AppColors.textSecondary;
    }
  }

  String _getPetTypeName(PetType type) {
    switch (type) {
      case PetType.dog:
        return 'Cachorro';
      case PetType.cat:
        return 'Gato';
      case PetType.bird:
        return 'Pássaro';
      case PetType.fish:
        return 'Peixe';
      case PetType.other:
        return 'Outro';
    }
  }

  String _getGenderName(PetGender gender) {
    switch (gender) {
      case PetGender.male:
        return 'Macho';
      case PetGender.female:
        return 'Fêmea';
    }
  }
}
