import 'package:flutter/material.dart';
import '../models/reto.dart';
import '../services/juego_service.dart';
import '../widgets/boton_principal.dart';
import '../widgets/tarjeta_info.dart';
import '../widgets/temporizador_widget.dart';
import '../widgets/barra_energia_widget.dart';

class PantallaJuego extends StatefulWidget {
  const PantallaJuego({super.key});

  @override
  State<PantallaJuego> createState() => _PantallaJuegoState();
}

class _PantallaJuegoState extends State<PantallaJuego> {
  late Reto reto;
  final JuegoService juegoService = JuegoService();

  int energia = 100;
  int errores = 0;

  @override
  void initState() {
    super.initState();
    reto = juegoService.obtenerRetoAleatorio();
  }

  void validarRespuesta(BuildContext context, String respuesta) {
    final bool respuestaCorrecta = juegoService.validarRespuesta(
      reto,
      respuesta,
    );

    if (respuestaCorrecta) {
      Navigator.pushReplacementNamed(
        context,
        '/resultado',
        arguments: {
          'resultado': 'ganada',
          'mensaje': 'Mision completada. La nave fue estabilizada.',
          'energia': energia.toString(),
          'errores': errores.toString(),
        },
      );
    } else {
      setState(() {
        errores++;
        energia -= 50;
      });

      if (energia <= 0) {
        Navigator.pushReplacementNamed(
          context,
          '/resultado',
          arguments: {
            'resultado': 'perdida',
            'mensaje': 'La energia llego a 0. La nave fallo.',
            'energia': energia.toString(),
            'errores': errores.toString(),
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Respuesta incorrecta. Energia reducida.'),
          ),
        );
      }
    }
  }

  void perderPorTiempo(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      '/resultado',
      arguments: {
        'resultado': 'perdida',
        'mensaje': 'Se acabo el tiempo. La nave no pudo estabilizarse.',
        'energia': energia.toString(),
        'errores': errores.toString(),
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
              BarraEnergiaWidget(
                energia: energia,
                errores: errores,
              ),
              const SizedBox(height: 16),
              TarjetaInfo(
                titulo: 'Mision actual',
                contenido: 'Reparar sistema: ${reto.sistema}',
              ),
              const SizedBox(height: 16),
              TemporizadorWidget(
                segundosIniciales: 60,
                alTerminar: () {
                  perderPorTiempo(context);
                },
              ),
              const SizedBox(height: 24),
              _contenidoPorRol(context, rol),
            ],
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TarjetaInfo(
          titulo: 'Pista general',
          contenido: reto.pistaAnalista,
        ),
      ],
    );
  }

  Widget _vistaIngeniero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TarjetaInfo(
          titulo: 'Regla tecnica',
          contenido: reto.reglaIngeniero,
        ),
      ],
    );
  }
}