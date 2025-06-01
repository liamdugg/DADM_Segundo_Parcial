import 'package:floor/floor.dart';

@entity
class Song {

  @primaryKey
  final int id;
  
  final String title;
  final String length;
  final int trackNumber;
  final int albumId;

  Song({
    required this.id, 
    required this.title, 
    required this.length, 
    required this.trackNumber, 
    required this.albumId
  });
}

final List<Song> allSongs = [

  // The Dark Side of the Moon
  Song(id: 1, title: "Speak to Me", length: "1:30", trackNumber: 1, albumId: 1),
  Song(id: 2, title: "Breathe", length: "2:43", trackNumber: 2, albumId: 1),
  Song(id: 3, title: "On the Run", length: "3:45", trackNumber: 3, albumId: 1),
  Song(id: 4, title: "Time", length: "6:53", trackNumber: 4, albumId: 1),
  Song(id: 5, title: "The Great Gig in the Sky", length: "4:44", trackNumber: 5, albumId: 1),
  Song(id: 6, title: "Money", length: "6:22", trackNumber: 6, albumId: 1),
  Song(id: 7, title: "Us and Them", length: "7:49", trackNumber: 7, albumId: 1),
  Song(id: 8, title: "Any Colour You Like", length: "3:26", trackNumber: 8, albumId: 1),
  Song(id: 9, title: "Brain Damage", length: "3:46", trackNumber: 9, albumId: 1),
  Song(id: 10, title: "Eclipse", length: "2:10", trackNumber: 10, albumId: 1),

  // Thriller
  Song(id: 11, title: "Wanna Be Startin' Somethin'", length: "6:03", trackNumber: 1, albumId: 2),
  Song(id: 12, title: "Baby Be Mine", length: "4:20", trackNumber: 2, albumId: 2),
  Song(id: 13, title: "The Girl Is Mine", length: "3:42", trackNumber: 3, albumId: 2),
  Song(id: 14, title: "Thriller", length: "5:57", trackNumber: 4, albumId: 2),
  Song(id: 15, title: "Beat It", length: "4:18", trackNumber: 5, albumId: 2),
  Song(id: 16, title: "Billie Jean", length: "4:54", trackNumber: 6, albumId: 2),
  Song(id: 17, title: "Human Nature", length: "4:06", trackNumber: 7, albumId: 2),
  Song(id: 18, title: "P.Y.T. (Pretty Young Thing)", length: "3:59", trackNumber: 8, albumId: 2),
  Song(id: 19, title: "The Lady in My Life", length: "4:59", trackNumber: 9, albumId: 2),

  // To Pimp a Butterfly (already provided, continuing ID)
  Song(id: 20, title: "Wesley's Theory", length: "4:47", trackNumber: 1, albumId: 3),
  Song(id: 21, title: "For Free? (Interlude)", length: "2:10", trackNumber: 2, albumId: 3),
  Song(id: 22, title: "King Kunta", length: "3:54", trackNumber: 3, albumId: 3),
  Song(id: 23, title: "Institutionalized", length: "4:31", trackNumber: 4, albumId: 3),
  Song(id: 24, title: "These Walls", length: "5:00", trackNumber: 5, albumId: 3),
  Song(id: 25, title: "u", length: "4:28", trackNumber: 6, albumId: 3),
  Song(id: 26, title: "Alright", length: "3:39", trackNumber: 7, albumId: 3),
  Song(id: 27, title: "For Sale? (Interlude)", length: "4:51", trackNumber: 8, albumId: 3),
  Song(id: 28, title: "Momma", length: "4:43", trackNumber: 9, albumId: 3),
  Song(id: 29, title: "Hood Politics", length: "4:52", trackNumber: 10, albumId: 3),
  Song(id: 30, title: "How Much a Dollar Cost", length: "4:21", trackNumber: 11, albumId: 3),
  Song(id: 31, title: "Complexion (A Zulu Love)", length: "4:23", trackNumber: 12, albumId: 3),
  Song(id: 32, title: "The Blacker the Berry", length: "5:28", trackNumber: 13, albumId: 3),
  Song(id: 33, title: "You Ain't Gotta Lie (Momma Said)", length: "4:01", trackNumber: 14, albumId: 3),
  Song(id: 34, title: "i", length: "5:36", trackNumber: 15, albumId: 3),
  Song(id: 35, title: "Mortal Man", length: "12:07", trackNumber: 16, albumId: 3),

  // Kind of Blue
  Song(id: 36, title: "So What", length: "9:22", trackNumber: 1, albumId: 4),
  Song(id: 37, title: "Freddie Freeloader", length: "9:46", trackNumber: 2, albumId: 4),
  Song(id: 38, title: "Blue in Green", length: "5:37", trackNumber: 3, albumId: 4),
  Song(id: 39, title: "All Blues", length: "11:33", trackNumber: 4, albumId: 4),
  Song(id: 40, title: "Flamenco Sketches", length: "9:26", trackNumber: 5, albumId: 4),

  // Back in Black
  Song(id: 41, title: "Hells Bells", length: "5:12", trackNumber: 1, albumId: 5),
  Song(id: 42, title: "Shoot to Thrill", length: "5:17", trackNumber: 2, albumId: 5),
  Song(id: 43, title: "What Do You Do for Money Honey", length: "3:33", trackNumber: 3, albumId: 5),
  Song(id: 44, title: "Givin the Dog a Bone", length: "3:30", trackNumber: 4, albumId: 5),
  Song(id: 45, title: "Let Me Put My Love into You", length: "4:16", trackNumber: 5, albumId: 5),
  Song(id: 46, title: "Back in Black", length: "4:15", trackNumber: 6, albumId: 5),
  Song(id: 47, title: "You Shook Me All Night Long", length: "3:30", trackNumber: 7, albumId: 5),
  Song(id: 48, title: "Have a Drink on Me", length: "3:57", trackNumber: 8, albumId: 5),
  Song(id: 49, title: "Shake a Leg", length: "4:06", trackNumber: 9, albumId: 5),
  Song(id: 50, title: "Rock and Roll Ain't Noise Pollution", length: "4:15", trackNumber: 10, albumId: 5),

  // 21
  Song(id: 51, title: "Rolling in the Deep", length: "3:48", trackNumber: 1, albumId: 6),
  Song(id: 52, title: "Rumour Has It", length: "3:43", trackNumber: 2, albumId: 6),
  Song(id: 53, title: "Turning Tables", length: "4:10", trackNumber: 3, albumId: 6),
  Song(id: 54, title: "Don't You Remember", length: "4:03", trackNumber: 4, albumId: 6),
  Song(id: 55, title: "Set Fire to the Rain", length: "4:02", trackNumber: 5, albumId: 6),
  Song(id: 56, title: "He Won't Go", length: "4:38", trackNumber: 6, albumId: 6),
  Song(id: 57, title: "Take It All", length: "3:48", trackNumber: 7, albumId: 6),
  Song(id: 58, title: "I'll Be Waiting", length: "4:01", trackNumber: 8, albumId: 6),
  Song(id: 59, title: "One and Only", length: "5:48", trackNumber: 9, albumId: 6),
  Song(id: 60, title: "Lovesong", length: "5:16", trackNumber: 10, albumId: 6),
  Song(id: 61, title: "Someone Like You", length: "4:45", trackNumber: 11, albumId: 6),

  // Good Kid, M.A.A.D City
  Song(id: 62, title: "Sherane a.k.a Master Splinter’s Daughter", length: "4:33", trackNumber: 1, albumId: 7),
  Song(id: 63, title: "Bitch, Don’t Kill My Vibe", length: "5:10", trackNumber: 2, albumId: 7),
  Song(id: 64, title: "Backseat Freestyle", length: "3:32", trackNumber: 3, albumId: 7),
  Song(id: 65, title: "The Art of Peer Pressure", length: "5:24", trackNumber: 4, albumId: 7),
  Song(id: 66, title: "Money Trees", length: "6:26", trackNumber: 5, albumId: 7),
  Song(id: 67, title: "Poetic Justice", length: "5:00", trackNumber: 6, albumId: 7),
  Song(id: 68, title: "good kid", length: "3:34", trackNumber: 7, albumId: 7),
  Song(id: 69, title: "m.A.A.d city", length: "5:50", trackNumber: 8, albumId: 7),
  Song(id: 70, title: "Swimming Pools (Drank)", length: "4:09", trackNumber: 9, albumId: 7),
  Song(id: 71, title: "Sing About Me, I’m Dying of Thirst", length: "12:03", trackNumber: 10, albumId: 7),
  Song(id: 72, title: "Real", length: "7:23", trackNumber: 11, albumId: 7),
  Song(id: 73, title: "Compton", length: "4:08", trackNumber: 12, albumId: 7),

  // Abbey Road
  Song(id: 74, title: "Come Together", length: "4:20", trackNumber: 1, albumId: 8),
  Song(id: 75, title: "Something", length: "3:03", trackNumber: 2, albumId: 8),
  Song(id: 76, title: "Maxwell's Silver Hammer", length: "3:27", trackNumber: 3, albumId: 8),
  Song(id: 77, title: "Oh! Darling", length: "3:26", trackNumber: 4, albumId: 8),
  Song(id: 78, title: "Octopus's Garden", length: "2:51", trackNumber: 5, albumId: 8),
  Song(id: 79, title: "I Want You (She's So Heavy)", length: "7:47", trackNumber: 6, albumId: 8),
  Song(id: 80, title: "Here Comes the Sun", length: "3:06", trackNumber: 7, albumId: 8),
  Song(id: 81, title: "Because", length: "2:45", trackNumber: 8, albumId: 8),
  Song(id: 82, title: "You Never Give Me Your Money", length: "4:02", trackNumber: 9, albumId: 8),
  Song(id: 83, title: "Golden Slumbers", length: "1:31", trackNumber: 10, albumId: 8),
  Song(id: 84, title: "Carry That Weight", length: "1:36", trackNumber: 11, albumId: 8),
  Song(id: 85, title: "The End", length: "2:05", trackNumber: 12, albumId: 8),
  Song(id: 86, title: "Her Majesty", length: "0:23", trackNumber: 13, albumId: 8),

  // The Eminem Show
  Song(id: 87, title: "White America", length: "5:24", trackNumber: 1, albumId: 9),
  Song(id: 88, title: "Business", length: "4:11", trackNumber: 2, albumId: 9),
  Song(id: 89, title: "Cleanin' Out My Closet", length: "4:57", trackNumber: 3, albumId: 9),
  Song(id: 90, title: "Square Dance", length: "5:23", trackNumber: 4, albumId: 9),
  Song(id: 91, title: "Without Me", length: "4:50", trackNumber: 5, albumId: 9),
  Song(id: 92, title: "Sing for the Moment", length: "5:39", trackNumber: 6, albumId: 9),
  Song(id: 93, title: "Superman", length: "5:50", trackNumber: 7, albumId: 9),
  Song(id: 94, title: "Hailie's Song", length: "5:20", trackNumber: 8, albumId: 9),

  // Blue Train
  Song(id: 95, title: "Blue Train", length: "10:43", trackNumber: 1, albumId: 10),
  Song(id: 96, title: "Moment's Notice", length: "9:10", trackNumber: 2, albumId: 10),
  Song(id: 97, title: "Locomotion", length: "7:14", trackNumber: 3, albumId: 10),
  Song(id: 98, title: "I'm Old Fashioned", length: "7:57", trackNumber: 4, albumId: 10),
  Song(id: 99, title: "Lazy Bird", length: "7:07", trackNumber: 5, albumId: 10),
];