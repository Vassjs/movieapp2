import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark().copyWith(
      ),
      home: const HomeScreen(),
    );
  }
}