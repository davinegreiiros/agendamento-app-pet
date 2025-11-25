// ignore: prefer_relative_imports
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_event.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_state.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/get_pets_by_owner.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/get_pet_by_id.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/create_pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/update_pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/delete_pet.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  PetBloc({
    required this.getPetsByOwner,
    required this.getPetById,
    required this.createPet,
    required this.updatePet,
    required this.deletePet,
  }) : super(const PetInitial()) {
    on<LoadPets>(_onLoadPets);
    on<LoadPetDetails>(_onLoadPetDetails);
    on<CreatePetRequested>(_onCreatePet);
    on<UpdatePetRequested>(_onUpdatePet);
    on<DeletePetRequested>(_onDeletePet);
  }

  final GetPetsByOwner getPetsByOwner;
  final GetPetById getPetById;
  final CreatePet createPet;
  final UpdatePet updatePet;
  final DeletePet deletePet;

  Future<void> _onLoadPets(LoadPets event, Emitter<PetState> emit) async {
    emit(const PetLoading());

    final result = await getPetsByOwner(event.ownerId);

    result.fold(
      (failure) => emit(PetError(failure.message)),
      (pets) => emit(PetsLoaded(pets)),
    );
  }

  Future<void> _onLoadPetDetails(
    LoadPetDetails event,
    Emitter<PetState> emit,
  ) async {
    emit(const PetLoading());

    final result = await getPetById(event.petId);

    result.fold(
      (failure) => emit(PetError(failure.message)),
      (pet) => emit(PetDetailsLoaded(pet)),
    );
  }

  Future<void> _onCreatePet(
    CreatePetRequested event,
    Emitter<PetState> emit,
  ) async {
    emit(const PetLoading());

    final result = await createPet(event.pet);

    result.fold(
      (failure) => emit(PetError(failure.message)),
      (pet) => emit(PetCreated(pet)),
    );
  }

  Future<void> _onUpdatePet(
    UpdatePetRequested event,
    Emitter<PetState> emit,
  ) async {
    emit(const PetLoading());

    final result = await updatePet(event.pet);

    result.fold(
      (failure) => emit(PetError(failure.message)),
      (pet) => emit(PetUpdated(pet)),
    );
  }

  Future<void> _onDeletePet(
    DeletePetRequested event,
    Emitter<PetState> emit,
  ) async {
    emit(const PetLoading());

    final result = await deletePet(event.petId);

    result.fold(
      (failure) => emit(PetError(failure.message)),
      (_) => emit(const PetDeleted()),
    );
  }
}
