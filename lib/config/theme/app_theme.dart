import 'package:flutter/material.dart';

final List<Color> colorsList = [
  Colors.green,
  Colors.purple,
  Colors.red,
  Colors.yellow,
  Colors.blue,
  Colors.pink,
  Colors.deepPurple,
  Colors.greenAccent,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorsList.length,
            'Selected color must be less or equals than ${colorsList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorsList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      );

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
