import 'package:flutter/material.dart';

class PantallaUnirseSala extends StatelessWidget {
  const PantallaUnirseSala({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unirse a sala')),
      body: const Center(
        child: Text('Pantalla para unirse a sala'),
      ),
    );
  }
}