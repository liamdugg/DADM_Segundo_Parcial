import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segundo_parcial/domain/models/album.dart';
import 'package:segundo_parcial/data/local_albums_repository.dart';
import 'package:segundo_parcial/presentation/widgets/custom_drawer.dart';
import 'package:segundo_parcial/presentation/providers/user_provider.dart';
import 'package:segundo_parcial/presentation/providers/album_provider.dart';

class HomeScreen extends ConsumerWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Home'),
      ),

      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username,
        image   : ref.read(loggedUserProvider).profileImage,
      ),

      body: _ItemListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(albumProvider.notifier).newAlbum();
          context.push('/editor');
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}

class _ItemListView extends StatefulWidget {
  
  @override
  State<_ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<_ItemListView> {
  
  final _repository= LocalAlbumsRepository();
  late Future<List<Album>> _futureAlbums;

  @override
  void initState() {
    super.initState();
    _futureAlbums = _repository.getAlbums();
  }
  
  Future<void> _refreshAlbums() async {
    setState(() {
      _futureAlbums = _repository.getAlbums();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureAlbums, 
      builder: (context, snapshot) {

        // Loading data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        // Error
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Albums loaded
        else if (snapshot.hasData) {
          final albumList = snapshot.data!;

          return _AlbumListView(
            albumList: albumList,
            onRefresh: _refreshAlbums,
          );
        }

        else {return Container(color: Colors.red);}
      }
    ); 
  }
}

class _AlbumListView extends StatelessWidget {
  
  final Function onRefresh;
  final List<Album> albumList;

  const _AlbumListView({
    required this.onRefresh, 
    required this.albumList
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        itemCount: albumList.length,
        itemBuilder: (context, index){
          return _AlbumView(album: albumList[index],);
        }
      ),
    );
  }
}

class _AlbumView extends ConsumerWidget {

  final Album album;

  const _AlbumView({required this.album});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;

    return Card(
      elevation: 2,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(width: 60, height: 60,
            child: (album.cover == null || album.cover == '')
                ? Image.asset('assets/messi.jpg', fit: BoxFit.cover)
                : Image.asset(album.cover!, fit: BoxFit.cover),
          ),
        ),
        title: Text(album.title, style: textStyle.titleMedium,),
        subtitle: Text(album.artist, style: textStyle.bodyMedium),
        trailing: Icon(Icons.arrow_forward),
        
        onTap: (){
          ref.read(albumProvider.notifier).copyAlbum(album); 
          context.push('/details/${album.id}');
        },
      ),
    );
  }
}