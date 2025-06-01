import 'package:segundo_parcial/main.dart';
import 'package:segundo_parcial/data/users_dao.dart';
import 'package:segundo_parcial/domain/models/user.dart';
import 'package:segundo_parcial/domain/repositories/users_repository.dart';

class LocalUsersRepository implements UsersRepository {
  final UsersDao _usersDao = usersDatabase.usersDao;

  @override
  Future<User?> getUserById(int id) {
    return _usersDao.findUserById(id);
  }

  @override
  Future<User?> authenticateUser(String username, String password) {
    return _usersDao.authenticateUser(username, password);
  }

}