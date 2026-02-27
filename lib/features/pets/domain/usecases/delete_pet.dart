// ignore: prefer_relative_imports
import 'package:dartz/dartz.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/core/errors/failures.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/repositories/pet_repository.dart';

class DeletePet {
  const DeletePet(this.repository);

  final PetRepository repository;

  Future<Either<Failure, void>> call(String petId) async {
    return await repository.deletePet(petId);
  }
}
