import 'package:flutter/material.dart';
import '../models/sala.dart';
import '../services/sala_service.dart';
import '../widgets/boton_principal.dart';

class PantallaUnirseSala extends StatefulWidget {
  const PantallaUnirseSala({super.key});

  @override
  State<PantallaUnirseSala> createState() => _PantallaUnirseSalaState();
}

class _PantallaUnirseSalaState extends State<PantallaUnirseSala> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController codigoController = TextEditingController();

  void unirseSala() {
    String nombre = nombreController.text;
    String codigo = codigoController.text;

    if (nombre.isEmpty || codigo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    final SalaService salaService = SalaService();
    final Sala sala = salaService.buscarSalaPorCodigo(codigo);

    Navigator.pushNamed(
      context,
      '/espera',
      arguments: {
        'nombre': nombre,
        'codigoSala': sala.codigo,
        'salaId': sala.id,
      },
    );
  }

  @override
  void dispose() {
    nombreController.dispose();
    codigoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unirse a sala'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.login, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Entrar a una sala',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Tu nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: codigoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Codigo de sala',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            BotonPrincipal(
              texto: 'Unirse',
              onPressed: unirseSala,
            ),
          ],
        ),
      ),
    );
  }
}