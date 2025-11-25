// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/models/pet_model.dart';

abstract class PetLocalDataSource {
  /// Gets cached pets for a specific owner
  Future<List<PetModel>?> getCachedPets(String ownerId);

  /// Caches a list of pets
  Future<void> cachePets(String ownerId, List<PetModel> pets);

  /// Clears all cached pets
  Future<void> clearCache();

  /// Caches a single pet
  Future<void> cachePet(PetModel pet);

  /// Gets a cached pet by ID
  Future<PetModel?> getCachedPet(String petId);

  /// Removes a pet from cache
  Future<void> removePet(String petId);
}
