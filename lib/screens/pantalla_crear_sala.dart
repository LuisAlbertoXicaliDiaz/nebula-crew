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
  String dificultadSeleccionada = 'facil';
  bool cargando = false;

  Future<void> crearSala() async {
    String nombre = nombreController.text;

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe tu nombre')),
      );
      return;
    }

    setState(() {
      cargando = true;
    });

    final SalaService salaService = SalaService();
    final Sala sala = await salaService.crearSala(
      dificultad: dificultadSeleccionada,
    );

    if (!mounted) {
      return;
    }

    setState(() {
      cargando = false;
    });

    Navigator.pushNamed(
      context,
      '/espera',
      arguments: {
        'nombre': nombre,
        'codigoSala': sala.codigo,
        'salaId': sala.id,
        'dificultad': dificultadSeleccionada,
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
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: dificultadSeleccionada,
              decoration: const InputDecoration(
                labelText: 'Dificultad',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'facil',
                  child: Text('Facil'),
                ),
                DropdownMenuItem(
                  value: 'medio',
                  child: Text('Medio'),
                ),
                DropdownMenuItem(
                  value: 'dificil',
                  child: Text('Dificil'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  dificultadSeleccionada = value ?? 'facil';
                });
              },
            ),
            const SizedBox(height: 20),
            cargando
                ? const CircularProgressIndicator()
                : BotonPrincipal(
                    texto: 'Crear sala',
                    onPressed: crearSala,
                  ),
          ],
        ),
      ),
    );
  }
}