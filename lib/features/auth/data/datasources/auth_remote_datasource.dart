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

class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (email == 'test@test.com' && password == '123456') {
      throw Exception('Credenciais inválidas');
    }

    return User(
      id: '1',
      name: 'Davi Negreiros',
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
    return null;
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
