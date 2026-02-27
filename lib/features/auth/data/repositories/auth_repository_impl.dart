import 'package:agendamento_pet_app/core/errors/failures.dart';
import 'package:agendamento_pet_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:agendamento_pet_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:agendamento_pet_app/features/auth/domain/entities/user.dart';
import 'package:agendamento_pet_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  @override
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.signInWithEmail(
        email: email,
        password: password,
      );
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final userModel = await remoteDataSource.signInWithGoogle();
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithFacebook() async {
    try {
      final userModel = await remoteDataSource.signInWithFacebook();
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.signUp(
        name: name,
        email: email,
        password: password,
      );
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearCache();
      return const Right(null);
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final cachedModel = await localDataSource.getCachedUser();
      if (cachedModel != null) {
        return Right(cachedModel.toEntity());
      }

      final userModel = await remoteDataSource.getCurrentUser();
      if (userModel != null) {
        await localDataSource.cacheUser(userModel);
      }
      return Right(userModel?.toEntity());
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String email,
  }) async {
    try {
      await remoteDataSource.resetPassword(email: email);
      return const Right(null);
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
