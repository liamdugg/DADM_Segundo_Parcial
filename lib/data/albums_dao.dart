import 'package:floor/floor.dart';
import 'package:segundo_parcial/domain/models/album.dart';
import 'package:segundo_parcial/domain/models/song.dart';

@dao
abstract class AlbumsDao {

  @Query('SELECT * FROM Album')
  Future<List<Album>> findAllAlbums();

  @Query('SELECT * FROM Album WHERE id = :id')
  Future<Album?> findAlbumById(int id);

  @Query('SELECT * FROM Song WHERE albumId = :albumId')
  Future<List<Song>> findSongsByAlbumId(int albumId);

  @insert
  Future<void> insertAlbum(Album album);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateAlbum(Album album);

  @Query('INSERT INTO Song (title, length, trackNumber, albumId) VALUES (:title, :length, :trackNumber, :albumId)')
  Future<void> insertSong(String title, String length, int trackNumber, int albumId);

  @Query('SELECT COUNT(*) FROM Album')
  Future<int?> getAlbumCount();

  // Technically I should also delete all the songs in the album
  @delete
  Future<void> deleteAlbum(Album album);
}