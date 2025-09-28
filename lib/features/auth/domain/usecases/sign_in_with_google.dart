// ignore: prefer_relative_imports
import 'package:dartz/dartz.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/shared/errors/failures.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/entities/user.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogle {
  const SignInWithGoogle(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, User>> call() async {
    return await repository.signInWithGoogle();
  }
}
