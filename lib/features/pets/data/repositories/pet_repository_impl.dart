// ignore: prefer_relative_imports
import 'package:dartz/dartz.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/shared/errors/failures.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/repositories/pet_repository.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/datasources/pet_remote_datasource.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/datasources/pet_local_datasource.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/models/pet_model.dart';

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
      // Try to get from cache first
      final cachedPets = await localDataSource.getCachedPets(ownerId);
      if (cachedPets != null && cachedPets.isNotEmpty) {
        return Right(cachedPets);
      }

      // If not in cache, fetch from remote
      final pets = await remoteDataSource.getPetsByOwner(ownerId);

      // Cache the results
      await localDataSource.cachePets(ownerId, pets);

      return Right(pets);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, Pet>> getPetById(String petId) async {
    try {
      // Try to get from cache first
      final cachedPet = await localDataSource.getCachedPet(petId);
      if (cachedPet != null) {
        return Right(cachedPet);
      }

      // If not in cache, fetch from remote
      final pet = await remoteDataSource.getPetById(petId);

      // Cache the result
      await localDataSource.cachePet(pet);

      return Right(pet);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, Pet>> createPet(Pet pet) async {
    try {
      final petModel = PetModel.fromEntity(pet);
      final createdPet = await remoteDataSource.createPet(petModel);

      // Cache the created pet
      await localDataSource.cachePet(createdPet);

      return Right(createdPet);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, Pet>> updatePet(Pet pet) async {
    try {
      final petModel = PetModel.fromEntity(pet);
      final updatedPet = await remoteDataSource.updatePet(petModel);

      // Update cache
      await localDataSource.cachePet(updatedPet);

      return Right(updatedPet);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, void>> deletePet(String petId) async {
    try {
      await remoteDataSource.deletePet(petId);

      // Remove from cache
      await localDataSource.removePet(petId);

      return const Right(null);
    } on Exception catch (e) {
      return Left(_handleException(e));
    }
  }

  Failure _handleException(Exception exception) {
    if (exception.toString().contains('SocketException') ||
        exception.toString().contains('NetworkException')) {
      return NetworkFailure(message: 'Erro de conexão');
    }

    return UnknownFailure(
      message: 'Erro inesperado: ${exception.toString()}',
    );
  }
}
