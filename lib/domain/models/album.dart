import 'package:floor/floor.dart';

@entity
class Album {
  
  @primaryKey
  final int id;

  final String title;
  final String artist;
  final int releaseYear;
  final String? cover;

  Album({
    required this.id,
    required this.title, 
    required this.artist, 
    required this.releaseYear, 
    this.cover,
  });
}

final List<Album> albumList = [
  Album(
    id: 1,
    title: 'The Dark Side of the Moon',
    artist: 'Pink Floyd',
    releaseYear: 1973,
    cover: 'assets/dsotm.png',
  ),
  Album(
    id: 2,
    title: 'Thriller',
    artist: 'Michael Jackson',
    releaseYear: 1982,
    cover: 'assets/thriller.jpg',
  ),
  Album(
    id: 3,
    title: 'To Pimp a Butterfly',
    artist: 'Kendrick Lamar',
    releaseYear: 2015,
    cover: 'assets/tpab.jpg',
  ),
  Album(
    id: 4,
    title: 'Kind of Blue',
    artist: 'Miles Davis',
    releaseYear: 1959,
    cover: 'assets/kindofblue.jpg',
  ),
  Album(
    id: 5,
    title: 'Back in Black',
    artist: 'AC/DC',
    releaseYear: 1980,
    cover: 'assets/backinblack.png',
  ),
  Album(
    id: 6,
    title: '21',
    artist: 'Adele',
    releaseYear: 2011,
    cover: 'assets/21.png',
  ),

  Album(
    id: 7,
    title: 'Good Kid, M.A.A.D City',
    artist: 'Kendrick Lamar',
    releaseYear: 2012,
    cover: 'assets/gkmc.jpg',
  ),
  
  Album(
    id: 8,
    title: 'Abbey Road',
    artist: 'The Beatles',
    releaseYear: 1969,
    cover: 'assets/abbey_road.jpg',
  ),
  
  Album(
    id: 9,
    title: 'The Eminem Show',
    artist: 'Eminem',
    releaseYear: 2002,
    cover: 'assets/the_eminem_show.jpg',
  ),
  
  Album(
    id: 10,
    title: 'Blue Train',
    artist: 'John Coltrane',
    releaseYear: 1957,
    cover: 'assets/bluetrain.jpg',
  ),

];