import 'package:flutter/material.dart';
import 'pages/selectScreen.dart';
import 'pages/learn.dart';
import 'pages/verify.dart';

void main() {
  runApp(MaterialApp(
      //theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Select(),
        '/verify': (context) => const Verify(),
        '/learn': (context) => const Learn()
      }));
}
