import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segundo_parcial/core/router/app_router.dart';
import 'package:segundo_parcial/core/database/users_database.dart';
import 'package:segundo_parcial/core/theme/app_theme_provider.dart';
import 'package:segundo_parcial/core/database/albums_database.dart';
import 'package:segundo_parcial/domain/models/album.dart';
import 'package:segundo_parcial/domain/models/song.dart';
import 'package:segundo_parcial/domain/models/user.dart';

late UsersDatabase usersDatabase;
late AlbumsDatabase albumsDatabase;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  usersDatabase  = await $FloorUsersDatabase.databaseBuilder('users_database.db').build();
  albumsDatabase = await $FloorAlbumsDatabase.databaseBuilder('albums_database.db').build();
  
  //Database initialization 
  /*for (User user in userList) {
    await usersDatabase.usersDao.insertUser(user);
  }

  for (Album album in albumList) {
    await albumsDatabase.albumsDao.insertAlbum(album);
  }

  for (Song song in allSongs) {
    await albumsDatabase.albumsDao.insertSong(song.title, song.length, song.trackNumber, song.albumId);
  }*/

  runApp(
    ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ref.watch(themeProvider).getTheme(),
    );
  }
}
