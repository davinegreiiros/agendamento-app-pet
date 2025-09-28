// ignore: prefer_relative_imports
import 'package:dartz/dartz.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/shared/errors/failures.dart';
// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/repositories/auth_repository.dart';

class SignOut {
  const SignOut(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}
