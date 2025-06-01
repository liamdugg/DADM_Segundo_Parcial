import 'package:go_router/go_router.dart';
import 'package:segundo_parcial/presentation/screens/home_screen.dart';
import 'package:segundo_parcial/presentation/screens/login_screen.dart';
import 'package:segundo_parcial/presentation/screens/album_screen.dart';
import 'package:segundo_parcial/presentation/screens/profile_screen.dart';
import 'package:segundo_parcial/presentation/screens/settings_screen.dart';
import 'package:segundo_parcial/presentation/screens/editor_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    
    GoRoute(
      path: '/login',
      builder:(context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/home',
      builder:(context, state) => const HomeScreen(),
    ),
    
    GoRoute(
      path: '/details/:id',
      builder:(context, state) {
        return AlbumScreen(albumId: int.tryParse(state.pathParameters['id']!) ?? 0);
      },
    ),
    
    GoRoute(
      path: '/settings',
      builder:(context, state) => const SettingsScreen(),
    ),
    
    GoRoute(
      path: '/profile/:user',
      builder:(context, state) => const ProfileScreen(),
    ),

    GoRoute(
      path: '/editor',
      builder: (context, state) => const EditorScreen(),
    )
  ],
);