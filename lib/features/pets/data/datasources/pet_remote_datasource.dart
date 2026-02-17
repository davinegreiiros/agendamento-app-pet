import 'package:agendamento_pet_app/features/pets/data/models/pet_model.dart';
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';

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

class MockPetRemoteDataSource implements PetRemoteDataSource {
  final List<PetModel> _mockPets = [
    PetModel(
      id: '1',
      name: 'Aurora',
      type: PetType.dog,
      breed: 'Golden Retriever',
      gender: PetGender.female,
      birthDate: DateTime(2021, 5, 15),
      imageUrl: 'assets/image/foto-pet1.png',
      ownerId: '1',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    PetModel(
      id: '2',
      name: 'Noel',
      type: PetType.dog,
      breed: 'Vira-lata',
      gender: PetGender.male,
      birthDate: DateTime(2020, 3, 20),
      imageUrl: 'assets/image/dog-splash-1.png',
      ownerId: '1',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Future<List<PetModel>> getPetsByOwner(String ownerId) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _mockPets.where((pet) => pet.ownerId == ownerId).toList();
  }

  @override
  Future<PetModel> getPetById(String petId) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return _mockPets.firstWhere(
      (pet) => pet.id == petId,
      orElse: () => throw Exception('Pet não encontrado'),
    );
  }

  @override
  Future<PetModel> createPet(PetModel pet) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final newPet = PetModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: pet.name,
      type: pet.type,
      breed: pet.breed,
      gender: pet.gender,
      birthDate: pet.birthDate,
      imageUrl: pet.imageUrl,
      ownerId: pet.ownerId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _mockPets.add(newPet);
    return newPet;
  }

  @override
  Future<PetModel> updatePet(PetModel pet) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final index = _mockPets.indexWhere((p) => p.id == pet.id);
    if (index != -1) {
      _mockPets[index] = pet;
      return pet;
    }
    throw Exception('Pet não encontrado');
  }

  @override
  Future<void> deletePet(String petId) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    _mockPets.removeWhere((pet) => pet.id == petId);
  }
}
