import 'package:segundo_parcial/domain/models/album.dart';
import 'package:segundo_parcial/domain/models/song.dart';

abstract class AlbumsRepository {
  Future<List<Album>> getAlbums();

  Future<Album?> getAlbumById(int id);
  
  Future<List<Song>> getSongsByAlbumId(int albumId);

  Future<void> insertAlbum(Album album);

  Future<void> updateAlbum(Album album);

  Future<int?> getAlbumCount();

  Future<void> insertSong(String title, String length, int trackNumber, int albumId);
}