// ignore: prefer_relative_imports
import 'package:flutter/material.dart';
// ignore: prefer_relative_imports
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/data/datasources/auth_local_datasource.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/data/datasources/auth_remote_datasource.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/data/repositories/auth_repository_impl.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/repositories/auth_repository.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/usecases/get_current_user.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_in_with_email.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_in_with_facebook.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_in_with_google.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_out.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_up.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/usecases/reset_password.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/entities/user.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/datasources/pet_local_datasource.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/datasources/pet_remote_datasource.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/repositories/pet_repository_impl.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/repositories/pet_repository.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/get_pets_by_owner.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/get_pet_by_id.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/create_pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/update_pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/usecases/delete_pet.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_bloc.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/data/models/pet_model.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';

class DependencyInjection {
  static Widget setupBlocProviders({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            getCurrentUser: GetCurrentUser(_getAuthRepository()),
            signInWithEmail: SignInWithEmail(_getAuthRepository()),
            signInWithGoogle: SignInWithGoogle(_getAuthRepository()),
            signInWithFacebook: SignInWithFacebook(_getAuthRepository()),
            signUp: SignUp(_getAuthRepository()),
            signOut: SignOut(_getAuthRepository()),
            resetPassword: ResetPassword(_getAuthRepository()),
          ),
        ),
        BlocProvider<PetBloc>(
          create: (context) => PetBloc(
            getPetsByOwner: GetPetsByOwner(_getPetRepository()),
            getPetById: GetPetById(_getPetRepository()),
            createPet: CreatePet(_getPetRepository()),
            updatePet: UpdatePet(_getPetRepository()),
            deletePet: DeletePet(_getPetRepository()),
          ),
        ),
      ],
      child: child,
    );
  }

  static AuthRepository _getAuthRepository() {
    // TODO: Implementar datasources reais
    // Por enquanto, vamos usar implementações mock
    return AuthRepositoryImpl(
      remoteDataSource: MockAuthRemoteDataSource(),
      localDataSource: MockAuthLocalDataSource(),
    );
  }

  static PetRepository _getPetRepository() {
    // TODO: Implementar datasources reais
    // Por enquanto, vamos usar implementações mock
    return PetRepositoryImpl(
      remoteDataSource: MockPetRemoteDataSource(),
      localDataSource: MockPetLocalDataSource(),
    );
  }
}

// Implementações mock temporárias
class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    // Simular delay de rede
    await Future<void>.delayed(const Duration(seconds: 1));

    // Simular erro para credenciais inválidas
    if (email == 'test@test.com' && password == '123456') {
      throw Exception('Credenciais inválidas');
    }

    return User(
      id: '1',
      name: 'Usuário Teste',
      email: email,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<User> signInWithGoogle() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return User(
      id: '2',
      name: 'Usuário Google',
      email: 'user@gmail.com',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<User> signInWithFacebook() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return User(
      id: '3',
      name: 'Usuário Facebook',
      email: 'user@facebook.com',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return User(
      id: '4',
      name: name,
      email: email,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<User?> getCurrentUser() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return null; // Simular usuário não logado
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

class MockAuthLocalDataSource implements AuthLocalDataSource {
  User? _cachedUser;

  @override
  Future<User?> getCachedUser() async {
    return _cachedUser;
  }

  @override
  Future<void> cacheUser(User user) async {
    _cachedUser = user;
  }

  @override
  Future<void> clearCache() async {
    _cachedUser = null;
  }
}

// Implementações mock temporárias para Pets
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
      name: 'Nina',
      type: PetType.dog,
      breed: 'Pastor Alemão',
      gender: PetGender.female,
      birthDate: DateTime(2020, 3, 20),
      imageUrl: 'assets/image/foto-pet2.png',
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
    // Update in the owner's list if it exists
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
    // Remove from all owner lists
    for (final ownerPets in _cachedPets.values) {
      ownerPets.removeWhere((pet) => pet.id == petId);
    }
  }
}
