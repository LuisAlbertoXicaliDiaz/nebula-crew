import 'package:flutter/material.dart';
import 'screens/pantalla_inicio.dart';
import 'screens/pantalla_crear_sala.dart';
import 'screens/pantalla_unirse_sala.dart';
import 'screens/pantalla_espera.dart';
import 'screens/pantalla_juego.dart';
import 'screens/pantalla_resultado.dart';
import 'screens/pantalla_instrucciones.dart';

void main() {
  runApp(const NebulaCrewApp());
}

class NebulaCrewApp extends StatelessWidget {
  const NebulaCrewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nebula Crew',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicio(),
        '/crear-sala': (context) => const PantallaCrearSala(),
        '/unirse-sala': (context) => const PantallaUnirseSala(),
        '/espera': (context) => const PantallaEspera(),
        '/juego': (context) => const PantallaJuego(),
        '/resultado': (context) => const PantallaResultado(),
        '/instrucciones': (context) => const PantallaInstrucciones(),
      },
    );
  }
}