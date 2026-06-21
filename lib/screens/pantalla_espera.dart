import 'package:flutter/material.dart';
import '../models/jugador.dart';
import '../services/jugador_service.dart';
import '../widgets/boton_principal.dart';
import '../widgets/tarjeta_info.dart';

class PantallaEspera extends StatefulWidget {
  const PantallaEspera({super.key});

  @override
  State<PantallaEspera> createState() => _PantallaEsperaState();
}

class _PantallaEsperaState extends State<PantallaEspera> {
  String rolSeleccionado = 'piloto';
  String dificultadSeleccionada = 'facil';
  bool dificultadCargada = false;

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String nombre = argumentos['nombre'] ?? 'Jugador';
    final String codigoSala = argumentos['codigoSala'] ?? '0000';
    final String salaId = argumentos['salaId'] ?? 'sala_demo';
    final String dificultadInicial = argumentos['dificultad'] ?? 'facil';

    if (!dificultadCargada) {
      dificultadSeleccionada = dificultadInicial;
      dificultadCargada = true;
    }

    final JugadorService jugadorService = JugadorService();
    final List<Jugador> jugadores = jugadorService.obtenerJugadoresSimulados(
      nombreJugadorPrincipal: nombre,
      salaId: salaId,
    );

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
                  final Jugador jugador = jugadores[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(jugador.nombre),
                      subtitle: Text('Rol sugerido: ${jugador.rol}'),
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
                    'salaId': salaId,
                    'rol': rolSeleccionado,
                    'dificultad': dificultadSeleccionada,
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