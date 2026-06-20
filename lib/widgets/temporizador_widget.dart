import 'dart:async';
import 'package:flutter/material.dart';

class TemporizadorWidget extends StatefulWidget {
  final int segundosIniciales;
  final VoidCallback alTerminar;

  const TemporizadorWidget({
    super.key,
    required this.segundosIniciales,
    required this.alTerminar,
  });

  @override
  State<TemporizadorWidget> createState() => _TemporizadorWidgetState();
}

class _TemporizadorWidgetState extends State<TemporizadorWidget> {
  late int segundosRestantes;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    segundosRestantes = widget.segundosIniciales;
    iniciarTemporizador();
  }

  void iniciarTemporizador() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (segundosRestantes <= 1) {
          timer.cancel();
          widget.alTerminar();
        } else {
          setState(() {
            segundosRestantes--;
          });
        }
      },
    );
  }

  String obtenerTiempo() {
    int minutos = segundosRestantes ~/ 60;
    int segundos = segundosRestantes % 60;

    String segundosTexto = segundos < 10 ? '0$segundos' : '$segundos';

    return '$minutos:$segundosTexto';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: segundosRestantes <= 10 ? Colors.red.shade900 : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer),
            const SizedBox(width: 10),
            Text(
              obtenerTiempo(),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}