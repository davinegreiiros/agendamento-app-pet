import 'package:agendamento_pet_app/core/errors/failures.dart';
import 'package:agendamento_pet_app/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signInWithGoogle();

  Future<Either<Failure, User>> signInWithFacebook();

  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, User?>> getCurrentUser();

  Future<Either<Failure, void>> resetPassword({
    required String email,
  });
}
