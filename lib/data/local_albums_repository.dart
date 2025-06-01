import 'package:segundo_parcial/main.dart';
import 'package:segundo_parcial/data/albums_dao.dart';
import 'package:segundo_parcial/domain/models/song.dart';
import 'package:segundo_parcial/domain/models/album.dart';
import 'package:segundo_parcial/domain/repositories/albums_repository.dart';


class LocalAlbumsRepository implements AlbumsRepository {
  final AlbumsDao _albumsDao = albumsDatabase.albumsDao;

  @override
  Future<List<Album>> getAlbums(){
    return _albumsDao.findAllAlbums();
  }

  @override
  Future<Album?> getAlbumById(int id) {
    return _albumsDao.findAlbumById(id);
  }

  @override
  Future<List<Song>> getSongsByAlbumId(int albumId) {
    return _albumsDao.findSongsByAlbumId(albumId);
  }

  @override
  Future<void> insertAlbum(Album album) {
    return _albumsDao.insertAlbum(album);
  }

  @override
  Future<void> updateAlbum(Album album) {
    return _albumsDao.updateAlbum(album);
  }

  @override
  Future<int?> getAlbumCount(){
    return _albumsDao.getAlbumCount();
  }
  
  @override
  Future<void> insertSong(String title, String length, int trackNumber, int albumId) {
    return _albumsDao.insertSong(title, length, trackNumber, albumId);
  }
  
}