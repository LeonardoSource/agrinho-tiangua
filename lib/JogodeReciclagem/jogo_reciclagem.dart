import 'package:flutter/material.dart';
import 'screens/screen.dart';

class ReciclaApp extends StatelessWidget {
  const ReciclaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recicla Rápido!',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const GameScreen(),
    );
  }
}
