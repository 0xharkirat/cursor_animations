import 'package:cursor_animations/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cursor',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


