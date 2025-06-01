// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $UsersDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $UsersDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $UsersDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<UsersDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorUsersDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $UsersDatabaseBuilderContract databaseBuilder(String name) =>
      _$UsersDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $UsersDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$UsersDatabaseBuilder(null);
}

class _$UsersDatabaseBuilder implements $UsersDatabaseBuilderContract {
  _$UsersDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $UsersDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $UsersDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<UsersDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UsersDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UsersDatabase extends UsersDatabase {
  _$UsersDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UsersDao? _usersDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER NOT NULL, `username` TEXT NOT NULL, `password` TEXT NOT NULL, `email` TEXT NOT NULL, `phone` TEXT NOT NULL, `city` TEXT NOT NULL, `country` TEXT NOT NULL, `profileImage` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UsersDao get usersDao {
    return _usersDaoInstance ??= _$UsersDao(database, changeListener);
  }
}

class _$UsersDao extends UsersDao {
  _$UsersDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'email': item.email,
                  'phone': item.phone,
                  'city': item.city,
                  'country': item.country,
                  'profileImage': item.profileImage
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'email': item.email,
                  'phone': item.phone,
                  'city': item.city,
                  'country': item.country,
                  'profileImage': item.profileImage
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> findAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int,
            username: row['username'] as String,
            password: row['password'] as String,
            email: row['email'] as String,
            phone: row['phone'] as String,
            city: row['city'] as String,
            country: row['country'] as String,
            profileImage: row['profileImage'] as String));
  }

  @override
  Future<User?> findUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int,
            username: row['username'] as String,
            password: row['password'] as String,
            email: row['email'] as String,
            phone: row['phone'] as String,
            city: row['city'] as String,
            country: row['country'] as String,
            profileImage: row['profileImage'] as String),
        arguments: [id]);
  }

  @override
  Future<User?> authenticateUser(
    String username,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM User WHERE username = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int,
            username: row['username'] as String,
            password: row['password'] as String,
            email: row['email'] as String,
            phone: row['phone'] as String,
            city: row['city'] as String,
            country: row['country'] as String,
            profileImage: row['profileImage'] as String),
        arguments: [username, password]);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }
}
