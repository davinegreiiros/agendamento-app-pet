import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agendamento_pet_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:agendamento_pet_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:agendamento_pet_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:agendamento_pet_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:agendamento_pet_app/features/auth/domain/usecases/get_current_user.dart';
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_in_with_facebook.dart';
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_out.dart';
import 'package:agendamento_pet_app/features/auth/domain/usecases/sign_up.dart';
import 'package:agendamento_pet_app/features/auth/domain/usecases/reset_password.dart';
import 'package:agendamento_pet_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:agendamento_pet_app/features/pets/data/datasources/pet_local_datasource.dart';
import 'package:agendamento_pet_app/features/pets/data/datasources/pet_remote_datasource.dart';
import 'package:agendamento_pet_app/features/pets/data/repositories/pet_repository_impl.dart';
import 'package:agendamento_pet_app/features/pets/domain/repositories/pet_repository.dart';
import 'package:agendamento_pet_app/features/pets/domain/usecases/get_pets_by_owner.dart';
import 'package:agendamento_pet_app/features/pets/domain/usecases/get_pet_by_id.dart';
import 'package:agendamento_pet_app/features/pets/domain/usecases/create_pet.dart';
import 'package:agendamento_pet_app/features/pets/domain/usecases/update_pet.dart';
import 'package:agendamento_pet_app/features/pets/domain/usecases/delete_pet.dart';
import 'package:agendamento_pet_app/features/pets/presentation/bloc/pet_bloc.dart';

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
    // TODO: Implementar datasources reais (Firebase, API, etc.)
    return AuthRepositoryImpl(
      remoteDataSource: MockAuthRemoteDataSource(),
      localDataSource: MockAuthLocalDataSource(),
    );
  }

  static PetRepository _getPetRepository() {
    // TODO: Implementar datasources reais (Firebase, API, etc.)
    return PetRepositoryImpl(
      remoteDataSource: MockPetRemoteDataSource(),
      localDataSource: MockPetLocalDataSource(),
    );
  }
}
