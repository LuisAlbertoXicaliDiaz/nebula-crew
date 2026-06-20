# Nebula Crew

Prototipo de juego cooperativo multijugador hecho con Flutter y Supabase.

## Idea general

Nebula Crew es un juego cooperativo para 3 jugadores inspirado en dinámicas donde cada jugador tiene información diferente. La temática del juego es una nave espacial con sistemas dañados que deben repararse antes de que termine el tiempo.

La idea no es desactivar una bomba, sino reparar sistemas de una nave como:

- Oxígeno
- Motor
- Escudos
- Energía
- Comunicaciones
- Navegación

## Cómo funciona

Cada jugador tiene un rol diferente:

### Piloto

Ve la consola de la nave.

Puede ver datos como:

- Sistema dañado
- Código
- Símbolo
- Botones disponibles

El Piloto ejecuta la acción final, pero no sabe por sí solo cuál es la correcta.

### Analista

Ve pistas generales.

Ayuda a interpretar la información que describe el Piloto.

### Ingeniero

Ve reglas técnicas.

Usa la información del Piloto y del Analista para dar la instrucción final.

## Ejemplo de partida

El Piloto ve:

```text
Sistema: Oxigeno
Codigo: A7X
Simbolo: Luna

El Analista ve:

Si el simbolo es Luna, revisa si el codigo contiene el numero 7.

El Ingeniero ve:

Si el sistema es Oxigeno y el codigo contiene 7, presiona el boton derecho.

Entonces el Piloto debe presionar el botón correcto para completar la misión.

Estado actual del prototipo

Actualmente el prototipo tiene:

Pantalla de inicio
Pantalla de instrucciones
Crear sala
Unirse a sala
Sala de espera simulada
Selector de rol para pruebas
Pantalla de partida por roles
Retos aleatorios simulados
Temporizador
Barra de energía
Sistema de errores
Pantalla de resultado
Resumen final con energía y errores
Tecnologías
Flutter
Dart
Supabase, planeado para la siguiente fase
GitHub
Estructura principal
lib/
  main.dart

  screens/
    pantalla_inicio.dart
    pantalla_instrucciones.dart
    pantalla_crear_sala.dart
    pantalla_unirse_sala.dart
    pantalla_espera.dart
    pantalla_juego.dart
    pantalla_resultado.dart

  models/
    jugador.dart
    sala.dart
    reto.dart

  services/
    supabase_service.dart
    sala_service.dart
    jugador_service.dart
    juego_service.dart

  widgets/
    boton_principal.dart
    tarjeta_info.dart
    temporizador_widget.dart
    barra_energia_widget.dart
Fase actual

Primera fase: prototipo funcional local/simulado.

El objetivo de esta fase es probar la mecánica principal antes de conectar Supabase.

Siguiente fase

La siguiente fase será conectar Supabase para que:

Las salas se creen realmente en base de datos
Los jugadores puedan entrar desde diferentes dispositivos
Los roles se asignen automáticamente
Cada jugador vea solo la información de su rol
La partida se sincronice en tiempo real

Después guarda y haz el commit final de hoy:

```bash
git add .
git commit -m "Actualizar README del prototipo"
git push