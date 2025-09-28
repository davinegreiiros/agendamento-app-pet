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
