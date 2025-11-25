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

class MockPetLocalDataSource implements PetLocalDataSource {
  final Map<String, List<PetModel>> _cachedPets = {};
  final Map<String, PetModel> _cachedPetById = {};

  @override
  Future<List<PetModel>?> getCachedPets(String ownerId) async {
    return _cachedPets[ownerId];
  }

  @override
  Future<void> cachePets(String ownerId, List<PetModel> pets) async {
    _cachedPets[ownerId] = pets;
    for (final pet in pets) {
      _cachedPetById[pet.id] = pet;
    }
  }

  @override
  Future<void> clearCache() async {
    _cachedPets.clear();
    _cachedPetById.clear();
  }

  @override
  Future<void> cachePet(PetModel pet) async {
    _cachedPetById[pet.id] = pet;
    final ownerPets = _cachedPets[pet.ownerId];
    if (ownerPets != null) {
      final index = ownerPets.indexWhere((p) => p.id == pet.id);
      if (index != -1) {
        ownerPets[index] = pet;
      } else {
        ownerPets.add(pet);
      }
    }
  }

  @override
  Future<PetModel?> getCachedPet(String petId) async {
    return _cachedPetById[petId];
  }

  @override
  Future<void> removePet(String petId) async {
    _cachedPetById.remove(petId);
    for (final ownerPets in _cachedPets.values) {
      ownerPets.removeWhere((pet) => pet.id == petId);
    }
  }
}
