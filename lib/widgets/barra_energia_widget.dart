import 'package:flutter/material.dart';

class BarraEnergiaWidget extends StatelessWidget {
  final int energia;
  final int errores;

  const BarraEnergiaWidget({
    super.key,
    required this.energia,
    required this.errores,
  });

  Color obtenerColorEnergia() {
    if (energia > 60) {
      return Colors.greenAccent;
    }

    if (energia > 30) {
      return Colors.orangeAccent;
    }

    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estado de la nave',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: energia / 100,
              minHeight: 12,
              color: obtenerColorEnergia(),
              backgroundColor: Colors.white24,
            ),
            const SizedBox(height: 8),
            Text('Energia: $energia%'),
            Text('Errores: $errores'),
          ],
        ),
      ),
    );
  }
}