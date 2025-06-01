// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AlbumsDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AlbumsDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AlbumsDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AlbumsDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAlbumsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AlbumsDatabaseBuilderContract databaseBuilder(String name) =>
      _$AlbumsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AlbumsDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AlbumsDatabaseBuilder(null);
}

class _$AlbumsDatabaseBuilder implements $AlbumsDatabaseBuilderContract {
  _$AlbumsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AlbumsDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AlbumsDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AlbumsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AlbumsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AlbumsDatabase extends AlbumsDatabase {
  _$AlbumsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AlbumsDao? _albumsDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Album` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `artist` TEXT NOT NULL, `releaseYear` INTEGER NOT NULL, `cover` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Song` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `length` TEXT NOT NULL, `trackNumber` INTEGER NOT NULL, `albumId` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AlbumsDao get albumsDao {
    return _albumsDaoInstance ??= _$AlbumsDao(database, changeListener);
  }
}

class _$AlbumsDao extends AlbumsDao {
  _$AlbumsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _albumInsertionAdapter = InsertionAdapter(
            database,
            'Album',
            (Album item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'artist': item.artist,
                  'releaseYear': item.releaseYear,
                  'cover': item.cover
                }),
        _albumUpdateAdapter = UpdateAdapter(
            database,
            'Album',
            ['id'],
            (Album item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'artist': item.artist,
                  'releaseYear': item.releaseYear,
                  'cover': item.cover
                }),
        _albumDeletionAdapter = DeletionAdapter(
            database,
            'Album',
            ['id'],
            (Album item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'artist': item.artist,
                  'releaseYear': item.releaseYear,
                  'cover': item.cover
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Album> _albumInsertionAdapter;

  final UpdateAdapter<Album> _albumUpdateAdapter;

  final DeletionAdapter<Album> _albumDeletionAdapter;

  @override
  Future<List<Album>> findAllAlbums() async {
    return _queryAdapter.queryList('SELECT * FROM Album',
        mapper: (Map<String, Object?> row) => Album(
            id: row['id'] as int,
            title: row['title'] as String,
            artist: row['artist'] as String,
            releaseYear: row['releaseYear'] as int,
            cover: row['cover'] as String?));
  }

  @override
  Future<Album?> findAlbumById(int id) async {
    return _queryAdapter.query('SELECT * FROM Album WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Album(
            id: row['id'] as int,
            title: row['title'] as String,
            artist: row['artist'] as String,
            releaseYear: row['releaseYear'] as int,
            cover: row['cover'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<Song>> findSongsByAlbumId(int albumId) async {
    return _queryAdapter.queryList('SELECT * FROM Song WHERE albumId = ?1',
        mapper: (Map<String, Object?> row) => Song(
            id: row['id'] as int,
            title: row['title'] as String,
            length: row['length'] as String,
            trackNumber: row['trackNumber'] as int,
            albumId: row['albumId'] as int),
        arguments: [albumId]);
  }

  @override
  Future<void> insertSong(
    String title,
    String length,
    int trackNumber,
    int albumId,
  ) async {
    await _queryAdapter.queryNoReturn(
        'INSERT INTO Song (title, length, trackNumber, albumId) VALUES (?1, ?2, ?3, ?4)',
        arguments: [title, length, trackNumber, albumId]);
  }

  @override
  Future<int?> getAlbumCount() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM Album',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<void> insertAlbum(Album album) async {
    await _albumInsertionAdapter.insert(album, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAlbum(Album album) async {
    await _albumUpdateAdapter.update(album, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteAlbum(Album album) async {
    await _albumDeletionAdapter.delete(album);
  }
}
