import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      // centerTitle: false,
      color: Colors.white,
      scrolledUnderElevation: 5),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
);
