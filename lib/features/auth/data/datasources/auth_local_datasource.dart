// ignore: prefer_relative_imports
import 'package:agendamento_pet_app/features/auth/domain/entities/user.dart';

abstract class AuthLocalDataSource {
  Future<User?> getCachedUser();
  Future<void> cacheUser(User user);
  Future<void> clearCache();
}
