import 'dart:async';
import 'package:floor/floor.dart';
import 'package:segundo_parcial/data/albums_dao.dart';
import 'package:segundo_parcial/domain/models/album.dart';
import 'package:segundo_parcial/domain/models/song.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'albums_database.g.dart';

@Database(version: 1, entities: [Album, Song])
abstract class AlbumsDatabase extends FloorDatabase {
  AlbumsDao get albumsDao;
}