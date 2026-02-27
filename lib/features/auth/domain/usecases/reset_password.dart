// ignore_for_file: directives_ordering, prefer_relative_imports

import 'package:dartz/dartz.dart';
import 'package:agendamento_pet_app/core/errors/failures.dart';
import 'package:agendamento_pet_app/features/auth/domain/repositories/auth_repository.dart';

class ResetPassword {
  const ResetPassword(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, void>> call({
    required String email,
  }) async =>
      repository.resetPassword(email: email);
}
