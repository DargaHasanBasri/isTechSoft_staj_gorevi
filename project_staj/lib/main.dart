import 'package:flutter/material.dart';
import 'introducing_character.dart';
import 'introducing_myself.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harry Potter Characters',
      home: const InfoCharacter(),
      routes: {
        'introducing_character': (context) => const InfoCharacter(),
        'introducing_myself': (context) => const MySelf(),
      },
    );
  }
}
