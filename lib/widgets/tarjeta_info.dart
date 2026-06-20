import 'package:flutter/material.dart';

class TarjetaInfo extends StatelessWidget {
  final String titulo;
  final String contenido;

  const TarjetaInfo({
    super.key,
    required this.titulo,
    required this.contenido,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(contenido),
          ],
        ),
      ),
    );
  }
}