import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  
  final String userName;
  final String image;
  
  const CustomDrawer({
    super.key,
    required this.userName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    final String currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      child: ListView(
        children: [
          
          _CustomDrawerHeader(
            userName: userName,
            image   : image,
          ),

          // Home Button
          ListTile(
            leading: const Icon(Icons.home),
            title  : const Text('Home'),
            onTap  : () { 
              if(currentRoute == '/home') {
                context.pop(); // remove drawer from navigation stack
              }
              else {
                context.pop();
                context.push('/home');
              } 
            }
          ),

          // Settings Button
          ListTile(
            leading: const Icon(Icons.settings),
            title  : const Text('Settings'),
            onTap  : () { 
              if(currentRoute == '/settings') {
                context.pop(); // remove drawer from navigation stack
              }
              else {
                context.pop();
                context.push('/settings');
              } 
            }
          ),

          // Profile Button
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap:() { 
              if(currentRoute == '/profile/$userName') {
                context.pop(); // remove drawer from navigation stack
              }
              else {
                context.pop();
                context.push('/profile/$userName');
              } 
            }
          ),
          
          Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => openDialog(context),
          ),

      ],),
    ); 
  }

  openDialog(BuildContext context) {
      showDialog(
       context: context,
       builder: (context) => 
        AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: [

            TextButton(
              onPressed: () => context.pop(), 
              child: Text('Cancel')
            ),

            FilledButton(
              onPressed: () => context.go('/login'), 
              child: Text('Logout')
            ),
          ],
        )
      );
  }
}

class _CustomDrawerHeader extends StatelessWidget {
  
  final String userName;
  final String image;

  const _CustomDrawerHeader({
    required this.userName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(image,
              fit: BoxFit.cover,
              height: 90,
              width: 90,
            ), 
          ),
          const SizedBox(height: 20,),
          Text(userName),
      ],),
    );
  }
}