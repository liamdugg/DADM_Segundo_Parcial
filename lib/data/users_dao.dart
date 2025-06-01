import 'package:floor/floor.dart';
import 'package:segundo_parcial/domain/models/user.dart';

@dao
abstract class UsersDao {

  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User?> findUserById(int id);

  @Query('SELECT * FROM User WHERE username = :username AND password = :password')
  Future<User?> authenticateUser(String username, String password);

  @insert
  Future<void> insertUser(User user);

  @delete
  Future<void> deleteUser(User user);
}