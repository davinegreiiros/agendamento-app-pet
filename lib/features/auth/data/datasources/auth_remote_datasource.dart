import 'package:agendamento_pet_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithGoogle();

  Future<UserModel> signInWithFacebook();

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();

  Future<void> resetPassword({
    required String email,
  });
}

class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (email == 'test@test.com' && password == '123456') {
      throw Exception('Credenciais inválidas');
    }

    return UserModel(
      id: '1',
      name: 'Davi Negreiros',
      email: email,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return UserModel(
      id: '2',
      name: 'Usuário Google',
      email: 'user@gmail.com',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return UserModel(
      id: '3',
      name: 'Usuário Facebook',
      email: 'user@facebook.com',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return UserModel(
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
  Future<UserModel?> getCurrentUser() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return null;
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
