// ignore: prefer_relative_imports
import 'package:dartz/dartz.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/core/errors/failures.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/entities/user.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/repositories/auth_repository.dart';

class SignInWithFacebook {
  const SignInWithFacebook(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, User>> call() async {
    return await repository.signInWithFacebook();
  }
}
