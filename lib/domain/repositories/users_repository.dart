import 'package:segundo_parcial/domain/models/user.dart';

abstract class UsersRepository {
  Future<User?> getUserById(int id);
  Future<User?> authenticateUser(String username, String password);
}