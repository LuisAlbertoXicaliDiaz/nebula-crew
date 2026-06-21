import 'dart:math';
import '../models/sala.dart';
import 'supabase_service.dart';

class SalaService {
  Future<Sala> crearSala({
    required String dificultad,
  }) async {
    String codigo = generarCodigoSala();

    final data = await SupabaseService.client
        .from('salas')
        .insert({
          'codigo': codigo,
          'estado': 'esperando',
          'dificultad': dificultad,
          'energia': 100,
          'errores': 0,
        })
        .select()
        .single();

    return Sala(
      id: data['id'],
      codigo: data['codigo'],
      estado: data['estado'],
    );
  }

  Future<Sala?> buscarSalaPorCodigo(String codigo) async {
    final data = await SupabaseService.client
        .from('salas')
        .select()
        .eq('codigo', codigo)
        .maybeSingle();

    if (data == null) {
      return null;
    }

    return Sala(
      id: data['id'],
      codigo: data['codigo'],
      estado: data['estado'],
    );
  }

  String generarCodigoSala() {
    Random random = Random();
    int numero = 1000 + random.nextInt(9000);

    return numero.toString();
  }
}