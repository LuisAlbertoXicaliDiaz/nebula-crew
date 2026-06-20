import 'package:flutter/material.dart';

class PantallaResultado extends StatelessWidget {
  const PantallaResultado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: const Center(
        child: Text('Resultado de la partida'),
      ),
    );
  }
}