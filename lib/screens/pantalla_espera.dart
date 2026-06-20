import 'package:flutter/material.dart';
import '../widgets/boton_principal.dart';
import '../widgets/tarjeta_info.dart';

class PantallaEspera extends StatelessWidget {
  const PantallaEspera({super.key});

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
              titulo: 'Código de sala',
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
            BotonPrincipal(
              texto: 'Iniciar partida',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/juego',
                  arguments: {
                    'nombre': nombre,
                    'codigoSala': codigoSala,
                    'rol': 'piloto',
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