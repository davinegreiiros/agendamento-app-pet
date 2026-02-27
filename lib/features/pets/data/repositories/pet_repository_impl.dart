import 'package:agendamento_pet_app/core/errors/failures.dart';
import 'package:agendamento_pet_app/features/pets/data/datasources/pet_local_datasource.dart';
import 'package:agendamento_pet_app/features/pets/data/datasources/pet_remote_datasource.dart';
import 'package:agendamento_pet_app/features/pets/data/models/pet_model.dart';
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';
import 'package:agendamento_pet_app/features/pets/domain/repositories/pet_repository.dart';
import 'package:dartz/dartz.dart';

class PetRepositoryImpl implements PetRepository {
  const PetRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final PetRemoteDataSource remoteDataSource;
  final PetLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Pet>>> getPetsByOwner(String ownerId) async {
    try {
      final cachedPets = await localDataSource.getCachedPets(ownerId);
      if (cachedPets != null && cachedPets.isNotEmpty) {
        return Right(cachedPets.map((m) => m.toEntity()).toList());
      }

      final pets = await remoteDataSource.getPetsByOwner(ownerId);
      await localDataSource.cachePets(ownerId, pets);
      return Right(pets.map((m) => m.toEntity()).toList());
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, Pet>> getPetById(String petId) async {
    try {
      final cachedPet = await localDataSource.getCachedPet(petId);
      if (cachedPet != null) {
        return Right(cachedPet.toEntity());
      }

      final pet = await remoteDataSource.getPetById(petId);
      await localDataSource.cachePet(pet);
      return Right(pet.toEntity());
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, Pet>> createPet(Pet pet) async {
    try {
      final petModel = PetModel.fromEntity(pet);
      final createdPet = await remoteDataSource.createPet(petModel);
      await localDataSource.cachePet(createdPet);
      return Right(createdPet.toEntity());
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, Pet>> updatePet(Pet pet) async {
    try {
      final petModel = PetModel.fromEntity(pet);
      final updatedPet = await remoteDataSource.updatePet(petModel);
      await localDataSource.cachePet(updatedPet);
      return Right(updatedPet.toEntity());
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deletePet(String petId) async {
    try {
      await remoteDataSource.deletePet(petId);
      await localDataSource.removePet(petId);
      return const Right(null);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  Failure _handleException(Exception exception) {
    if (exception.toString().contains('SocketException') ||
        exception.toString().contains('NetworkException')) {
      return const NetworkFailure('Erro de conexão');
    }
    return UnknownFailure('Erro inesperado: $exception');
  }
}
