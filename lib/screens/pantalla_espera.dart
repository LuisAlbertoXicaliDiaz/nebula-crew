import 'package:flutter/material.dart';

class PantallaEspera extends StatelessWidget {
  const PantallaEspera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sala de espera')),
      body: const Center(
        child: Text('Esperando jugadores'),
      ),
    );
  }
}