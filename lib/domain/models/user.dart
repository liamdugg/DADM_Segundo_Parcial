import 'package:floor/floor.dart';

@entity
class User {
  
  @primaryKey
  final int id;
  
  final String username;
  final String password;
  final String email;
  final String phone;
  final String city;
  final String country;
  final String profileImage;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.city,
    required this.country,
    required this.profileImage,
  });
}

//used to generate the database elements
final List<User> userList = List.generate(10, (index) {
  final i = index + 1; // Start from 1
  return User(
    id: i,
    username: 'liam$i',
    password: 'contraseña',
    email   : 'liam$i@gmail.com',
    phone   : '15-6264-5759',
    city    : 'City$i',
    country : 'Country$i',
    profileImage: 'assets/messi.jpg',
  );
});
