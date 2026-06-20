import 'dart:math';
import '../models/reto.dart';

class JuegoService {
  final Random random = Random();

  Reto obtenerRetoAleatorio() {
    final List<Reto> retos = [
      Reto(
        id: 'reto_1',
        salaId: 'sala_demo',
        sistema: 'Oxigeno',
        codigo: 'A7X',
        simbolo: 'Luna',
        respuestaCorrecta: 'derecho',
        pistaAnalista:
            'Si el simbolo es Luna, revisa si el codigo contiene el numero 7.',
        reglaIngeniero:
            'Si el sistema es Oxigeno y el codigo contiene 7, presiona el boton derecho.',
        estado: 'activo',
      ),
      Reto(
        id: 'reto_2',
        salaId: 'sala_demo',
        sistema: 'Motor',
        codigo: 'M3B',
        simbolo: 'Sol',
        respuestaCorrecta: 'centro',
        pistaAnalista:
            'Si el simbolo es Sol, revisa si el sistema principal es Motor.',
        reglaIngeniero:
            'Si el sistema es Motor y el codigo contiene 3, presiona el boton centro.',
        estado: 'activo',
      ),
      Reto(
        id: 'reto_3',
        salaId: 'sala_demo',
        sistema: 'Escudos',
        codigo: 'E9K',
        simbolo: 'Estrella',
        respuestaCorrecta: 'izquierdo',
        pistaAnalista:
            'Si el simbolo es Estrella, pregunta si el codigo contiene el numero 9.',
        reglaIngeniero:
            'Si el sistema es Escudos y el codigo contiene 9, presiona el boton izquierdo.',
        estado: 'activo',
      ),
    ];

    int indice = random.nextInt(retos.length);
    return retos[indice];
  }

  bool validarRespuesta(Reto reto, String respuesta) {
    return respuesta == reto.respuestaCorrecta;
  }
}