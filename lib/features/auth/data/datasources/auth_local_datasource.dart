import 'package:agendamento_pet_app/features/auth/domain/entities/user.dart';

abstract class AuthLocalDataSource {
  Future<User?> getCachedUser();
  Future<void> cacheUser(User user);
  Future<void> clearCache();
}

class MockAuthLocalDataSource implements AuthLocalDataSource {
  User? _cachedUser;

  @override
  Future<User?> getCachedUser() async => _cachedUser;

  @override
  Future<void> cacheUser(User user) async {
    _cachedUser = user;
  }

  @override
  Future<void> clearCache() async {
    _cachedUser = null;
  }
}
