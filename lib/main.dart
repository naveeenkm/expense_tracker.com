import 'package:expense_tracker/widget/expences.dart';
import 'package:flutter/material.dart';

var kcolorSceme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 98, 70, 223));
var kDarkTheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkTheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkTheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkTheme.primaryContainer,
              foregroundColor: kDarkTheme.onPrimaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorSceme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorSceme.onPrimaryContainer,
          foregroundColor: kcolorSceme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kcolorSceme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorSceme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kcolorSceme.onSecondaryContainer,
                fontSize: 16,
              ), // TextStyle
            ),
      ),
      home: const Expence(),
    ),
  );
}
