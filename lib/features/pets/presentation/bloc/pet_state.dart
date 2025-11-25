// ignore: prefer_relative_imports
import 'package:equatable/equatable.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';

abstract class PetState extends Equatable {
  const PetState();

  @override
  List<Object?> get props => [];
}

class PetInitial extends PetState {
  const PetInitial();
}

class PetLoading extends PetState {
  const PetLoading();
}

class PetsLoaded extends PetState {
  const PetsLoaded(this.pets);

  final List<Pet> pets;

  @override
  List<Object?> get props => [pets];
}

class PetDetailsLoaded extends PetState {
  const PetDetailsLoaded(this.pet);

  final Pet pet;

  @override
  List<Object?> get props => [pet];
}

class PetCreated extends PetState {
  const PetCreated(this.pet);

  final Pet pet;

  @override
  List<Object?> get props => [pet];
}

class PetUpdated extends PetState {
  const PetUpdated(this.pet);

  final Pet pet;

  @override
  List<Object?> get props => [pet];
}

class PetDeleted extends PetState {
  const PetDeleted();
}

class PetError extends PetState {
  const PetError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
