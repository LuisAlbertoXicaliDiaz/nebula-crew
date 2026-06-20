import '../models/reto.dart';

class JuegoService {
  Reto obtenerRetoInicial() {
    return Reto(
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
    );
  }

  bool validarRespuesta(Reto reto, String respuesta) {
    return respuesta == reto.respuestaCorrecta;
  }
}