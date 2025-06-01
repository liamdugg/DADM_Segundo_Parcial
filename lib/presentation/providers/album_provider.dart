import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segundo_parcial/domain/models/album.dart';

final albumProvider = StateNotifierProvider<ThemeNotifier, Album>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<Album> {

  ThemeNotifier() : super(
    Album(id: 0, title: '', artist: '', releaseYear: 0, cover: null),
  );

  void copyAlbum(Album album) {
    state = Album(
      id: album.id,
      title: album.title,
      artist: album.artist,
      releaseYear: album.releaseYear,
      cover: album.cover,
    );
  }

  void newAlbum() {
    state = Album(
      id: 0,
      title: 'new',
      artist: 'new',
      releaseYear: 1920,
      cover: null,
    );
  }
}