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
      estado: 'activo',
    );
  }

  bool validarRespuesta(Reto reto, String respuesta) {
    return respuesta == reto.respuestaCorrecta;
  }
}