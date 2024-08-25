import 'package:flutter/material.dart';
import 'package:mapa/mapa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Mapa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Mapa(), // Defina a tela do mapa como principal
    );
  }
}
