import 'package:flutter/material.dart';

class PantallaCrearSala extends StatelessWidget {
  const PantallaCrearSala({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear sala')),
      body: const Center(
        child: Text('Pantalla para crear sala'),
      ),
    );
  }
}