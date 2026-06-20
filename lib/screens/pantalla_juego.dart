import 'package:flutter/material.dart';
import '../widgets/boton_principal.dart';
import '../widgets/tarjeta_info.dart';
import '../widgets/temporizador_widget.dart';

class PantallaJuego extends StatelessWidget {
  const PantallaJuego({super.key});

  void validarRespuesta(BuildContext context, String respuesta) {
    if (respuesta == 'derecho') {
      Navigator.pushNamed(
        context,
        '/resultado',
        arguments: {
          'resultado': 'ganada',
          'mensaje': 'Mision completada. La nave fue estabilizada.',
        },
      );
    } else {
      Navigator.pushNamed(
        context,
        '/resultado',
        arguments: {
          'resultado': 'perdida',
          'mensaje': 'Respuesta incorrecta. El sistema de la nave fallo.',
        },
      );
    }
  }

  void perderPorTiempo(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: {
        'resultado': 'perdida',
        'mensaje': 'Se acabo el tiempo. La nave no pudo estabilizarse.',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String nombre = argumentos['nombre'] ?? 'Jugador';
    final String codigoSala = argumentos['codigoSala'] ?? '0000';
    final String rol = argumentos['rol'] ?? 'piloto';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TarjetaInfo(
              titulo: 'Jugador',
              contenido: '$nombre | Sala: $codigoSala',
            ),
            const SizedBox(height: 16),
            TarjetaInfo(
              titulo: 'Rol asignado',
              contenido: rol.toUpperCase(),
            ),
            const SizedBox(height: 16),
            TemporizadorWidget(
              segundosIniciales: 60,
              alTerminar: () {
                perderPorTiempo(context);
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _contenidoPorRol(context, rol),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contenidoPorRol(BuildContext context, String rol) {
    if (rol == 'piloto') {
      return _vistaPiloto(context);
    }

    if (rol == 'analista') {
      return _vistaAnalista();
    }

    if (rol == 'ingeniero') {
      return _vistaIngeniero();
    }

    return const Center(
      child: Text('Rol no reconocido'),
    );
  }

  Widget _vistaPiloto(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TarjetaInfo(
          titulo: 'Consola de la nave',
          contenido: 'Sistema: Oxigeno\nCodigo: A7X\nSimbolo: Luna',
        ),
        const SizedBox(height: 16),
        const Text(
          'Acciones disponibles',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        BotonPrincipal(
          texto: 'Boton izquierdo',
          onPressed: () {
            validarRespuesta(context, 'izquierdo');
          },
        ),
        const SizedBox(height: 8),
        BotonPrincipal(
          texto: 'Boton centro',
          onPressed: () {
            validarRespuesta(context, 'centro');
          },
        ),
        const SizedBox(height: 8),
        BotonPrincipal(
          texto: 'Boton derecho',
          onPressed: () {
            validarRespuesta(context, 'derecho');
          },
        ),
      ],
    );
  }

  Widget _vistaAnalista() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TarjetaInfo(
          titulo: 'Pista general',
          contenido:
              'Si el simbolo es Luna, revisa si el codigo contiene el numero 7.',
        ),
      ],
    );
  }

  Widget _vistaIngeniero() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TarjetaInfo(
          titulo: 'Regla tecnica',
          contenido:
              'Si el sistema es Oxigeno y el codigo contiene 7, presiona el boton derecho.',
        ),
      ],
    );
  }
}