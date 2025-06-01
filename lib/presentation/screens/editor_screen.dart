import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:segundo_parcial/data/local_albums_repository.dart';
import 'package:segundo_parcial/domain/models/album.dart';
import 'package:segundo_parcial/domain/models/song.dart';
import 'package:segundo_parcial/main.dart';
import 'package:segundo_parcial/presentation/widgets/custom_drawer.dart';
import 'package:segundo_parcial/presentation/providers/user_provider.dart';
import 'package:segundo_parcial/presentation/providers/album_provider.dart';

class EditorScreen extends ConsumerWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Edit Album'),
      ),
      
      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username,
        image   : ref.read(loggedUserProvider).profileImage,
      ),
      
      body: _EditFormView()
    );
  }
}

class _EditFormView extends ConsumerWidget {
  
  final editFormKey      = GlobalKey<FormState>();
  final nameController   = TextEditingController();
  final artistController = TextEditingController();
  final yearController   = TextEditingController();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final album = ref.read(albumProvider);    
    
    nameController.text   = album.id==0 ? '' : album.title;
    artistController.text = album.id==0 ? '' : album.artist;
    yearController.text   = album.id==0 ? '' : album.releaseYear.toString();

    return Form(
      key: editFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          // Album Name Form
          _EditFormField(
            labelText : 'Album Name', 
            controller: nameController, 
            validator : validateName, 
            icon      : Icon(Icons.album),
          ),
          SizedBox(height: 20),

          // Artist Form
          _EditFormField(
            labelText : 'Artist Name', 
            controller: artistController, 
            validator : validateArtist, 
            icon      : Icon(Icons.person),
          ),
          SizedBox(height: 20),

          // Release Year Form
          _EditFormField(
            labelText: 'Release Year', 
            controller: yearController, 
            validator: validateYear, 
            icon: Icon(Icons.calendar_month),
          ),
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () async => saveChanges(context, ref), 
            child: const Text('Save changes')
          ),

        ],
      ),
    );
  }

  String? validateName(String? value) {
    
    // there are album names that are a single character
    if (value != null && value.isNotEmpty) {
      return null;
    }
    
    return 'Album name is required';
  }

  String? validateArtist(String? value) {
    
    // there are artist names that are a single character
    // and can have numbers or special characters
    if (value != null && value.isNotEmpty) {
      return null;
    }
    
    return 'Artist name is required';
  }

  String? validateYear(String? value) {

    if(value == null || value.isEmpty){
      return 'Year is required';
    }

    // valid numbers between 1000 and 2025
    else if(!RegExp(r'^(1[0-9]{3}|200[0-9]|201[0-9]|202[0-5])$').hasMatch(value)){
      return 'Invalid year';
    }
    
    return null;
  }

  void saveChanges(BuildContext context, WidgetRef ref) async {

    if(editFormKey.currentState!.validate()){
      
      int? count = 0;
      Album album = ref.read(albumProvider);
      final repository = LocalAlbumsRepository();
      
      if(album.id == 0) {
        try{
          count = await getAlbumCount() ?? 0;
          album = updateProvider(count+1, ref);
          await repository.insertAlbum(album);
          await insertNewAlbumSongs(album.id);
        } 
    
        catch(e){
          debugPrint('\n\n\nError getting album count: $e\n\n\n');
        }
      }

      else if (album.id > 0){
        if(isAlbumChanged(album)){
          try{
            album = updateProvider(album.id, ref);
            await repository.updateAlbum(album);
          } catch(e){
            debugPrint('Error updating album: $e');
          }
        }
        else {}
      }
      
      if(context.mounted) {
        context.go('/home');
        context.push('/details/${album.id}');
      }
    }
    else {}
  }

  bool isAlbumChanged(Album album){
    
    if(album.title == nameController.text    && 
       album.artist == artistController.text &&
       album.releaseYear.toString() == yearController.text 
    ){
      return false;
    }

    return true;
  } 

  // IF I USE THIS FUNCTION THE ALBUM PAGE WONT WORK. DONT KNOW WHY
  Future<void> addNewAlbum(Album album, WidgetRef ref) async {
    
    int count = 0;
    final repository = LocalAlbumsRepository();

    try{
      count = await getAlbumCount() ?? 0;
      album = updateProvider(count+1, ref);
      await repository.insertAlbum(album);
      await insertNewAlbumSongs(album.id);
    } 
    
    catch(e){
      debugPrint('\n\n\nError getting album count: $e\n\n\n');
    }
  }
  
  Album updateProvider(int id, WidgetRef ref) {
    final album = ref.read(albumProvider);
    ref.read(albumProvider.notifier).copyAlbum(
        Album(
          id          : id,
          title       : nameController.text,
          artist      : artistController.text,
          releaseYear : int.tryParse(yearController.text) ?? 1900,
          cover: album.cover,
        )
    );

    return ref.read(albumProvider);
  }

  Future<void> insertNewAlbumSongs(int id) async {
    final repository = LocalAlbumsRepository();
    
    final List<Song> songList = List.generate(5, (index) {
      return Song(
          id: index+100,
          title: 'Song ${index+100}',
          albumId: id,
          trackNumber: index,
          length: '${index+1}:00',
      );
    });

    for (Song song in songList) {
      await repository.insertSong(song.title, song.length, song.trackNumber, song.albumId);
    }
  }
  
  Future<int?> getAlbumCount() async {
    return albumsDatabase.albumsDao.getAlbumCount();
  }
  
}

class _EditFormField extends StatelessWidget {
  
  final Icon icon;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  
  const _EditFormField({
    required this.labelText,
    required this.validator,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child  : TextFormField(
        controller : controller,
        validator  : validator,
        
        decoration: InputDecoration(
          labelText : labelText,
          hintText  : labelText,
          border    : OutlineInputBorder(),
          prefixIcon: icon,
        ),
      ),
    );
  }
}