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

  bool cargando = false;

  Future<void> unirseSala() async {
    String nombre = nombreController.text;
    String codigo = codigoController.text;

    if (nombre.isEmpty || codigo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    setState(() {
      cargando = true;
    });

    final SalaService salaService = SalaService();
    final Sala? sala = await salaService.buscarSalaPorCodigo(codigo);

    if (!mounted) {
      return;
    }

    setState(() {
      cargando = false;
    });

    if (sala == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No existe una sala con ese codigo')),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      '/espera',
      arguments: {
        'nombre': nombre,
        'codigoSala': sala.codigo,
        'salaId': sala.id,
        'dificultad': 'facil',
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
            TextField(
              controller: codigoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Codigo de sala',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    codigoController.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            cargando
                ? const CircularProgressIndicator()
                : BotonPrincipal(
                    texto: 'Unirse',
                    onPressed: unirseSala,
                  ),
          ],
        ),
      ),
    );
  }
}