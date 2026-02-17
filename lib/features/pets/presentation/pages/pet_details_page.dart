// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/core/constants/app_constants.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_event.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_state.dart';
// ignore: prefer_relative_imports
// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter/material.dart';
// ignore: prefer_relative_imports
import 'package:flutter_bloc/flutter_bloc.dart';

class PetDetailsPage extends StatefulWidget {
  const PetDetailsPage({super.key, required this.petId});

  final String petId;

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PetBloc>().add(LoadPetDetails(widget.petId));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.background,
        body: BlocConsumer<PetBloc, PetState>(
          listener: (context, state) {
            if (state is PetDeleted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pet removido com sucesso'),
                  backgroundColor: AppColors.success,
                ),
              );
            }
          },
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
                  ],
                ),
              );
            }

            if (state is PetDetailsLoaded) {
              return _buildPetDetails(state.pet);
            }

            return const SizedBox.shrink();
          },
        ),
      );

  Widget _buildPetDetails(Pet pet) => CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        child: pet.imageUrl != null
                            ? Image.asset(
                                pet.imageUrl!,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => ColoredBox(
                                  color: Colors.white.withOpacity(0.2),
                                  child: const Icon(
                                    Icons.pets,
                                    size: 80,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : ColoredBox(
                                color: Colors.white.withOpacity(0.2),
                                child: const Icon(
                                  Icons.pets,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      pet.name,
                      style: AppTextStyles.headlineMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${pet.breed} • ${pet.ageDescription}',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    // TODO: Navigate to edit page
                  } else if (value == 'delete') {
                    _showDeleteConfirmation(pet);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Editar'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Excluir'),
                  ),
                ],
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSection(
                  'Informações Básicas',
                  [
                    _buildInfoRow('Tipo', _getPetTypeName(pet.type)),
                    _buildInfoRow('Raça', pet.breed),
                    _buildInfoRow('Sexo', _getGenderName(pet.gender)),
                    _buildInfoRow('Idade', pet.ageDescription),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                _buildSection(
                  'Datas',
                  [
                    _buildInfoRow(
                      'Data de Nascimento',
                      _formatDate(pet.birthDate),
                    ),
                    _buildInfoRow(
                      'Cadastrado em',
                      _formatDate(pet.createdAt),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      );

  Widget _buildSection(String title, List<Widget> children) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppBorderRadius.lg),
              border: Border.all(
                color: AppColors.textSecondary.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: children,
            ),
          ),
        ],
      );

  Widget _buildInfoRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );

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

  String _formatDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  void _showDeleteConfirmation(Pet pet) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir Pet'),
        content: Text('Tem certeza que deseja excluir ${pet.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<PetBloc>().add(DeletePetRequested(pet.id));
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}
