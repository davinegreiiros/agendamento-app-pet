// ignore: prefer_relative_imports
import 'package:equatable/equatable.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';

abstract class PetEvent extends Equatable {
  const PetEvent();

  @override
  List<Object?> get props => [];
}

class LoadPets extends PetEvent {
  const LoadPets(this.ownerId);

  final String ownerId;

  @override
  List<Object?> get props => [ownerId];
}

class LoadPetDetails extends PetEvent {
  const LoadPetDetails(this.petId);

  final String petId;

  @override
  List<Object?> get props => [petId];
}

class CreatePetRequested extends PetEvent {
  const CreatePetRequested(this.pet);

  final Pet pet;

  @override
  List<Object?> get props => [pet];
}

class UpdatePetRequested extends PetEvent {
  const UpdatePetRequested(this.pet);

  final Pet pet;

  @override
  List<Object?> get props => [pet];
}

class DeletePetRequested extends PetEvent {
  const DeletePetRequested(this.petId);

  final String petId;

  @override
  List<Object?> get props => [petId];
}
