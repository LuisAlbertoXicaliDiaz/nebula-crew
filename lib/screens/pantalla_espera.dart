import 'package:flutter/material.dart';
import '../widgets/boton_principal.dart';
import '../widgets/tarjeta_info.dart';

class PantallaEspera extends StatefulWidget {
  const PantallaEspera({super.key});

  @override
  State<PantallaEspera> createState() => _PantallaEsperaState();
}

class _PantallaEsperaState extends State<PantallaEspera> {
  String rolSeleccionado = 'piloto';

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String nombre = argumentos['nombre'] ?? 'Jugador';
    final String codigoSala = argumentos['codigoSala'] ?? '0000';

    final List<String> jugadores = [
      nombre,
      'Analista invitado',
      'Ingeniero invitado',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sala de espera'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TarjetaInfo(
              titulo: 'Codigo de sala',
              contenido: codigoSala,
            ),
            const SizedBox(height: 20),
            Text(
              'Jugadores conectados: ${jugadores.length}/3',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: jugadores.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(jugadores[index]),
                    ),
                  );
                },
              ),
            ),
            DropdownButtonFormField<String>(
              value: rolSeleccionado,
              decoration: const InputDecoration(
                labelText: 'Rol para probar',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'piloto',
                  child: Text('Piloto'),
                ),
                DropdownMenuItem(
                  value: 'analista',
                  child: Text('Analista'),
                ),
                DropdownMenuItem(
                  value: 'ingeniero',
                  child: Text('Ingeniero'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  rolSeleccionado = value ?? 'piloto';
                });
              },
            ),
            const SizedBox(height: 16),
            BotonPrincipal(
              texto: 'Iniciar partida',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/juego',
                  arguments: {
                    'nombre': nombre,
                    'codigoSala': codigoSala,
                    'rol': rolSeleccionado,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}