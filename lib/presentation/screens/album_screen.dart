import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segundo_parcial/domain/models/song.dart';
import 'package:segundo_parcial/domain/models/album.dart';
import 'package:segundo_parcial/data/local_albums_repository.dart';
import 'package:segundo_parcial/presentation/widgets/custom_drawer.dart';
import 'package:segundo_parcial/presentation/providers/user_provider.dart';
import 'package:segundo_parcial/presentation/providers/album_provider.dart';

class AlbumScreen extends ConsumerStatefulWidget{
  
  final int albumId;
  const AlbumScreen({super.key, required this.albumId});
  
  @override
  AlbumScreenState createState() => AlbumScreenState();
}

class AlbumScreenState extends ConsumerState<AlbumScreen> {
  
  late Future<List<Song>> futureSongs;
  final _repository = LocalAlbumsRepository();

  @override
  void initState() {
    super.initState();
    futureSongs = _repository.getSongsByAlbumId(widget.albumId);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Details'),
        actions: [ 
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/editor')
          ),
        ],
      ),
      
      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username,
        image   : ref.read(loggedUserProvider).profileImage,
      ),

      body: FutureBuilder(
        future: futureSongs, 
        builder: (context, snapshot) {
         
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
        
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Albums loaded
          else if (snapshot.hasData) {
            final songList = snapshot.data!;

            return PageView(
              children: [
                _AlbumDetailsPage(
                  album: ref.watch(albumProvider),
                ),
                
                _TrackListPage(
                  album: ref.watch(albumProvider),
                  songList: songList,
                ),
             ],
            );
          }

          else { return const Text('Something Went Wrong');}
        }
      )
    );   
  }
}

class _AlbumDetailsPage extends StatelessWidget {
  
  final Album album;
  const _AlbumDetailsPage({required this.album});
 
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          (album.cover == null || album.cover == '')
            ? Image.asset('assets/messi.jpg', fit: BoxFit.cover)
            : Image.asset(album.cover!, fit: BoxFit.cover),
          const SizedBox(height:20),
          Text(album.title, style: textStyle.titleLarge),
          Text(album.artist, style: textStyle.titleMedium),
          Text(album.releaseYear.toString()),
        ],
      ),
    );      
  }
}

class _TrackListPage extends StatelessWidget {
  
  final Album album;
  final List<Song> songList;

  const _TrackListPage({
    required this.songList,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return ListView.builder(
      itemCount: songList.length +1,
      itemBuilder: (context, i) {
        
        if(i == 0) {
          return ListTile(
            title   : Text('Track Name', style: textStyle.titleMedium),
            trailing: Icon(Icons.watch_later_outlined),
          );
        }

        else {
          return ListTile(
            leading : (album.cover == null || album.cover == '')
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:Image.asset('assets/messi.jpg', height:60, width: 60, fit: BoxFit.cover)
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(album.cover!, height: 60, width: 60, fit: BoxFit.cover)
                ),
            title   : Text(songList[i-1].title, style: textStyle.titleMedium,),
            subtitle: Text(album.artist),
            trailing: Text(songList[i-1].length, style: textStyle.bodyMedium),
          );
        }
      },
    );
  }
}
