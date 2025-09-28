// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> signInWithEmail({
    required String email,
    required String password,
  });

  Future<User> signInWithGoogle();

  Future<User> signInWithFacebook();

  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<User?> getCurrentUser();

  Future<void> resetPassword({
    required String email,
  });
}
