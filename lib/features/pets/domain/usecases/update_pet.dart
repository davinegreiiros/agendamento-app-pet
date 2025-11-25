// ignore: prefer_relative_imports
import 'package:dartz/dartz.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/shared/errors/failures.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/repositories/pet_repository.dart';

class UpdatePet {
  const UpdatePet(this.repository);

  final PetRepository repository;

  Future<Either<Failure, Pet>> call(Pet pet) async {
    return await repository.updatePet(pet);
  }
}
