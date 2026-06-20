import 'package:flutter/material.dart';

class PantallaJuego extends StatelessWidget {
  const PantallaJuego({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Partida')),
      body: const Center(
        child: Text('Pantalla del juego'),
      ),
    );
  }
}