// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/models/pet_model.dart';

abstract class PetRemoteDataSource {
  /// Gets all pets for a specific owner
  Future<List<PetModel>> getPetsByOwner(String ownerId);

  /// Gets a single pet by ID
  Future<PetModel> getPetById(String petId);

  /// Creates a new pet
  Future<PetModel> createPet(PetModel pet);

  /// Updates an existing pet
  Future<PetModel> updatePet(PetModel pet);

  /// Deletes a pet
  Future<void> deletePet(String petId);
}
