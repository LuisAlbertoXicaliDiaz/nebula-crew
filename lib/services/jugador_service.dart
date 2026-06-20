import '../models/jugador.dart';

class JugadorService {
  Jugador crearJugador({
    required String nombre,
    required String salaId,
    required String rol,
  }) {
    return Jugador(
      id: 'jugador_demo',
      nombre: nombre,
      salaId: salaId,
      rol: rol,
    );
  }

  List<Jugador> obtenerJugadoresSimulados({
    required String nombreJugadorPrincipal,
    required String salaId,
  }) {
    return [
      Jugador(
        id: 'jugador_1',
        nombre: nombreJugadorPrincipal,
        salaId: salaId,
        rol: 'piloto',
      ),
      Jugador(
        id: 'jugador_2',
        nombre: 'Analista invitado',
        salaId: salaId,
        rol: 'analista',
      ),
      Jugador(
        id: 'jugador_3',
        nombre: 'Ingeniero invitado',
        salaId: salaId,
        rol: 'ingeniero',
      ),
    ];
  }
}