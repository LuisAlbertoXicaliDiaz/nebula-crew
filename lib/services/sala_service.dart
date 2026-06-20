import 'dart:math';
import '../models/sala.dart';

class SalaService {
  Sala crearSala() {
    String codigo = generarCodigoSala();

    return Sala(
      id: 'sala_demo',
      codigo: codigo,
      estado: 'esperando',
    );
  }

  Sala buscarSalaPorCodigo(String codigo) {
    return Sala(
      id: 'sala_demo',
      codigo: codigo,
      estado: 'esperando',
    );
  }

  String generarCodigoSala() {
    Random random = Random();
    int numero = 1000 + random.nextInt(9000);

    return numero.toString();
  }
}