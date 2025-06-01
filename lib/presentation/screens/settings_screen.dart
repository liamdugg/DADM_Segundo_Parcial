import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segundo_parcial/core/theme/app_theme.dart';
import 'package:segundo_parcial/core/theme/app_theme_provider.dart';
import 'package:segundo_parcial/presentation/providers/user_provider.dart';
import 'package:segundo_parcial/presentation/widgets/custom_drawer.dart';

class SettingsScreen extends ConsumerWidget {
  
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      
      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username,
        image   : ref.read(loggedUserProvider).profileImage,
      ),

      body: _SettingsView(),
    );
  }
}

class _SettingsView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Column(
      children: [
        
        // Dark Mode Toggle
        SwitchListTile(
          title     : const Text('Dark Mode'),
          subtitle  : const Text('Enable dark mode'),
          secondary : const Icon(Icons.dark_mode),
          value     : ref.watch(themeProvider).isDarkMode,
          onChanged : (value) => ref.read(themeProvider.notifier).toggleDarkMode(),
        ),

        // Accent Color Selection
        ExpansionTile(
          title    : const Text('Accent Color'),
          subtitle : const Text('Change accent color'),
          leading  : const Icon(Icons.color_lens),
          initiallyExpanded: true,
          children : colorList.asMap().entries.map((entry) {
            final int index = entry.key;
            final MyColor color = entry.value;

            return RadioListTile(
              title: Text(color.name),
              value: index,
              groupValue: ref.watch(themeProvider).selectedColor,
              onChanged: (value) => 
                ref.read(themeProvider.notifier).changeColorTheme(value!),
            );
          }).toList(),
        ),
      ],
    );
  }
}