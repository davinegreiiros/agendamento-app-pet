// ignore: prefer_relative_imports
import 'package:dartz/dartz.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/core/errors/failures.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/repositories/pet_repository.dart';

class GetPetById {
  const GetPetById(this.repository);

  final PetRepository repository;

  Future<Either<Failure, Pet>> call(String petId) async {
    return await repository.getPetById(petId);
  }
}
