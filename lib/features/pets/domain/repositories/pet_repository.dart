// ignore: prefer_relative_imports
import 'package:dartz/dartz.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/shared/errors/failures.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';

abstract class PetRepository {
  Future<Either<Failure, List<Pet>>> getPetsByOwner(String ownerId);
  Future<Either<Failure, Pet>> getPetById(String petId);
  Future<Either<Failure, Pet>> createPet(Pet pet);
  Future<Either<Failure, Pet>> updatePet(Pet pet);
  Future<Either<Failure, void>> deletePet(String petId);
}
