import 'package:flutter/material.dart';

const brightness = Brightness.light;

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.green,
  brightness: brightness,
  inputDecorationTheme: const InputDecorationTheme(
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
  ),
  appBarTheme:
      const AppBarTheme(centerTitle: true, backgroundColor: Colors.grey),
);
