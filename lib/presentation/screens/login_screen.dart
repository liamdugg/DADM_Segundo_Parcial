import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:segundo_parcial/data/local_users_repository.dart';
import 'package:segundo_parcial/presentation/providers/form_field_provider.dart';
import 'package:segundo_parcial/presentation/providers/user_provider.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // Username Form
            _CustomFormField(
              labelText: 'Username',
              icon: Icon(Icons.person), 
              validator: validateUser, 
              controller: userController,
            ),

            const SizedBox(height: 20),
            
            // Password Form
            _CustomFormField(
              labelText: 'Password',
              icon: Icon(Icons.lock),  
              validator: validatePassword, 
              controller: passController,
              isPassword: true,
            ),
            
            const SizedBox(height: 10),
            
            // Login and Sign Up Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){}, 
                    child: const Text('Sign Up'),
                  ),
                  
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 1)),
                  
                  FilledButton(
                    onPressed: () => onLoginButtonPressed(context, ref),
                    child: const Text('Login'),
                  ),
              ],),
            ),
        ],),
      ),
    );
  }

  String? validateUser (String? value) {
    
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }

    else if (value.isNotEmpty && value.length > 3) {
      return null;
    }
    return 'Invalid username';
  }

  String? validatePassword (String? value) {

    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    else if (value.isNotEmpty && value.length > 3) {
      return null;
    }
    return 'Invalid password';
  }

  void onLoginButtonPressed(BuildContext context, WidgetRef ref) async {

    LocalUsersRepository repo = LocalUsersRepository();

    if(loginFormKey.currentState!.validate()){
      try {
        final user = await repo.authenticateUser(userController.text, passController.text);

        if (context.mounted) {
          if (user != null) {
            ref.read(loggedUserProvider.notifier).setUser(user);
            context.go('/home');
          }

          else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Invalid credentials')),
            );
          } 
        }
      }

      catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    }
  }
}

class _CustomFormField extends ConsumerWidget {
  
  final bool isPassword;
  final String labelText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final Icon icon;
  
  const _CustomFormField({
    required this.labelText,
    required this.validator,
    required this.controller,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool toggle = ref.watch(formFieldProvider);

    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child  : TextFormField(
        controller  : controller,
        validator   : validator,
        obscureText : isPassword ? toggle : false,
        
        decoration: InputDecoration(
          labelText  : labelText,
          hintText   : labelText,
          border     : OutlineInputBorder(),
          prefixIcon : icon,
          suffixIcon : isPassword 
            ? IconButton(
              icon: toggle ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () => ref.read(formFieldProvider.notifier).state = !toggle,
            ) 
            : null,
        ),
      ),
    );
  }
}