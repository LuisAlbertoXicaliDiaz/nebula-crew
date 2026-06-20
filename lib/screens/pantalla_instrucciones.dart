import 'package:flutter/material.dart';
import '../widgets/tarjeta_info.dart';

class PantallaInstrucciones extends StatelessWidget {
  const PantallaInstrucciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Como jugar'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TarjetaInfo(
              titulo: 'Objetivo',
              contenido:
                  'Tres jugadores deben reparar una nave espacial antes de que termine el tiempo.',
            ),
            SizedBox(height: 16),
            TarjetaInfo(
              titulo: 'Piloto',
              contenido:
                  'Ve la consola de la nave: sistema, codigo, simbolo y botones. Pero no sabe que accion es correcta.',
            ),
            SizedBox(height: 16),
            TarjetaInfo(
              titulo: 'Analista',
              contenido:
                  'Ve pistas generales. Ayuda a interpretar la informacion que describe el Piloto.',
            ),
            SizedBox(height: 16),
            TarjetaInfo(
              titulo: 'Ingeniero',
              contenido:
                  'Ve reglas tecnicas. Usa la informacion del Piloto y del Analista para dar la instruccion final.',
            ),
            SizedBox(height: 16),
            TarjetaInfo(
              titulo: 'Ejemplo',
              contenido:
                  'El Piloto dice: veo Oxigeno, codigo A7X y simbolo Luna.\n\nEl Analista dice: si es Luna, revisa si el codigo tiene 7.\n\nEl Ingeniero dice: si es Oxigeno y tiene 7, presiona el boton derecho.',
            ),
          ],
        ),
      ),
    );
  }
}