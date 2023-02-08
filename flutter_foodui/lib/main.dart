import 'package:flutter/material.dart';
import 'package:flutter_foodui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food ui',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}
