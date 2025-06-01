import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segundo_parcial/domain/models/user.dart';

final loggedUserProvider = StateNotifierProvider<ThemeNotifier, User>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<User> {

  ThemeNotifier() : super(
    User(
      id          : 0, 
      username    :'default', 
      password    :'default', 
      email       :'default', 
      phone       :'default', 
      city        :'default', 
      country     :'default', 
      profileImage: 'assets/21.png'
    ),
  );

  void setUser(User user) {
    state = User(
      id          : user.id,
      username    : user.username, 
      password    : user.password,
      email       : user.email,
      phone       : user.phone,
      city        : user.city,
      country     : user.country,
      profileImage: user.profileImage,
    );
  }
}