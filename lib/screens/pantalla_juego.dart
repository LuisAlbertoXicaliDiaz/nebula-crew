import 'package:flutter/material.dart';
import '../models/reto.dart';
import '../services/juego_service.dart';
import '../widgets/boton_principal.dart';
import '../widgets/tarjeta_info.dart';
import '../widgets/temporizador_widget.dart';

class PantallaJuego extends StatelessWidget {
  const PantallaJuego({super.key});

  void validarRespuesta(BuildContext context, Reto reto, String respuesta) {
    final JuegoService juegoService = JuegoService();
    final bool respuestaCorrecta = juegoService.validarRespuesta(
      reto,
      respuesta,
    );

    if (respuestaCorrecta) {
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

    final JuegoService juegoService = JuegoService();
    final Reto reto = juegoService.obtenerRetoInicial();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partida'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
              _contenidoPorRol(context, rol, reto),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contenidoPorRol(BuildContext context, String rol, Reto reto) {
    if (rol == 'piloto') {
      return _vistaPiloto(context, reto);
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

  Widget _vistaPiloto(BuildContext context, Reto reto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TarjetaInfo(
          titulo: 'Consola de la nave',
          contenido:
              'Sistema: ${reto.sistema}\nCodigo: ${reto.codigo}\nSimbolo: ${reto.simbolo}',
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
            validarRespuesta(context, reto, 'izquierdo');
          },
        ),
        const SizedBox(height: 8),
        BotonPrincipal(
          texto: 'Boton centro',
          onPressed: () {
            validarRespuesta(context, reto, 'centro');
          },
        ),
        const SizedBox(height: 8),
        BotonPrincipal(
          texto: 'Boton derecho',
          onPressed: () {
            validarRespuesta(context, reto, 'derecho');
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