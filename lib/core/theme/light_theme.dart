import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      // centerTitle: false,
      // color: Colors.green.shade200,
      ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
