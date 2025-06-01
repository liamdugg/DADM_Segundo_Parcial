import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segundo_parcial/presentation/providers/user_provider.dart';
import 'package:segundo_parcial/presentation/widgets/custom_drawer.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      
      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username,
        image   : ref.read(loggedUserProvider).profileImage,
      ),
      
      body: _UpdateProfileScreen(),
    );
  }
}

class _UpdateProfileScreen extends ConsumerWidget {
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 150, height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      ref.read(loggedUserProvider).profileImage,
                      fit: BoxFit.cover
                    ),
                  ),
                ),

                Positioned(bottom: 0, right: 0,
                  child: Container(
                    width: 35, height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100), color: Colors.blueGrey),
                      child: const Icon(
                        Icons.camera_alt, 
                        color: Colors.black, 
                        size: 20
                      ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Text('Liam Duggan', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 3),
            Text('User id: ${ref.read(loggedUserProvider).id}', style: Theme.of(context).textTheme.bodyMedium),
            Divider(thickness: 0.5, color: Colors.grey),

            // Username
            _InfoBox(
              title: 'Username',
              info: ref.read(loggedUserProvider).username,
              icon: Icons.person
            ),
            
            // Email
            _InfoBox(
              title: 'Email',
              info: ref.read(loggedUserProvider).email,
              icon: Icons.email
            ),
            
            // Phone
            _InfoBox(
              title: 'Phone Number',
              info: ref.read(loggedUserProvider).phone,
              icon: Icons.phone
            ),
            
            // City
            _InfoBox(
              title: 'City',
              info: ref.read(loggedUserProvider).city,
              icon: Icons.location_city
            ),

            // Country
            _InfoBox(
              title: 'Country',
              info: ref.read(loggedUserProvider).country,
              icon: Icons.public
            ),

        ],),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  
  final String title;
  final String info;
  final IconData icon;

  const _InfoBox({
    required this.title, 
    required this.info, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading  : Icon(icon),
            title    : Text(title, style: Theme.of(context).textTheme.titleMedium),
            subtitle : Text(info , style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
        
        SizedBox(height: 5),
      ],
    );
  }
}