import 'package:flutter/material.dart';
import '../models/sala.dart';
import '../services/sala_service.dart';
import '../widgets/boton_principal.dart';

class PantallaCrearSala extends StatefulWidget {
  const PantallaCrearSala({super.key});

  @override
  State<PantallaCrearSala> createState() => _PantallaCrearSalaState();
}

class _PantallaCrearSalaState extends State<PantallaCrearSala> {
  final TextEditingController nombreController = TextEditingController();

  void crearSala() {
    String nombre = nombreController.text;

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe tu nombre')),
      );
      return;
    }

    final SalaService salaService = SalaService();
    final Sala sala = salaService.crearSala();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear sala'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_circle_outline, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Crear nueva sala',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText: 'Tu nombre',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton( 
                  icon: const Icon(Icons.clear), 
                  onPressed: () {
                    nombreController.clear();
                  }
                )
              ),
            ),
            const SizedBox(height: 20),
            BotonPrincipal(
              texto: 'Crear sala',
              onPressed: crearSala,
            ),
          ],
        ),
      ),
    );
  }
}