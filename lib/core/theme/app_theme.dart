import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false});

  ThemeData getTheme() {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor].color,
    );
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode   : isDarkMode    ?? this.isDarkMode,
    );
  }
}

class MyColor {
  final String name;
  final Color color;

  MyColor({required this.name, required this.color});
}

final List<MyColor> colorList = [
  MyColor(name: 'Red'   , color: Colors.red),
  MyColor(name: 'Green' , color: Colors.green),
  MyColor(name: 'Blue'  , color: Colors.blue),
  MyColor(name: 'Yellow', color: Colors.yellow),
  MyColor(name: 'Purple', color: Colors.purple),
  MyColor(name: 'Orange', color: Colors.orange),
];
