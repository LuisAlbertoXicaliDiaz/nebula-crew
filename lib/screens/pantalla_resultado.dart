import 'package:flutter/material.dart';
import '../widgets/boton_principal.dart';
import '../widgets/tarjeta_info.dart';

class PantallaResultado extends StatelessWidget {
  const PantallaResultado({super.key});

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String resultado = argumentos['resultado'] ?? 'perdida';
    final String mensaje = argumentos['mensaje'] ?? 'La partida termino.';
    final String energia = argumentos['energia'] ?? '0';
    final String errores = argumentos['errores'] ?? '0';

    final bool gano = resultado == 'ganada';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gano ? Icons.check_circle : Icons.cancel,
              size: 100,
              color: gano ? Colors.greenAccent : Colors.redAccent,
            ),
            const SizedBox(height: 24),
            Text(
              gano ? 'Mision completada' : 'Mision fallida',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            TarjetaInfo(
              titulo: 'Resumen',
              contenido: 'Energia restante: $energia%\nErrores: $errores',
            ),
            const SizedBox(height: 40),
BotonPrincipal(
  texto: 'Jugar otra vez',
  onPressed: () {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/crear-sala',
      (route) => false,
    );
  },
),
const SizedBox(height: 12),
BotonPrincipal(
  texto: 'Volver al inicio',
  onPressed: () {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (route) => false,
    );
  },
),
          ],
        ),
      ),
    );
  }
}