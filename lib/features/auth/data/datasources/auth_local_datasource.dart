import 'package:agendamento_pet_app/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> getCachedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> clearCache();
}

class MockAuthLocalDataSource implements AuthLocalDataSource {
  UserModel? _cachedUser;

  @override
  Future<UserModel?> getCachedUser() async => _cachedUser;

  @override
  Future<void> cacheUser(UserModel user) async {
    _cachedUser = user;
  }

  @override
  Future<void> clearCache() async {
    _cachedUser = null;
  }
}
