NEBULA CREW - PROTOTIPO FASE 1
================================

Este archivo explica la idea del proyecto para que otra IA, profesor o desarrollador pueda entender que se quiere construir en la primera fase.


1. IDEA GENERAL DEL JUEGO
-------------------------

Nombre provisional:
Nebula Crew

Tipo de proyecto:
Juego cooperativo multijugador para celular.

Cantidad inicial de jugadores:
3 jugadores.

Tema:
Tres tripulantes deben reparar una nave espacial antes de que se acabe el tiempo o falle el sistema.

Importante:
La idea NO es desactivar una bomba. El juego se basa en reparar sistemas de una nave, como oxigeno, motor, energia, escudos, comunicacion o navegacion.

Objetivo de la primera version:
Que tres jugadores entren a una misma sala, reciban roles diferentes y resuelvan un reto sencillo comunicandose entre ellos.


2. TECNOLOGIAS PLANEADAS
------------------------

Frontend:
Flutter / Dart

Base de datos:
Supabase

Tiempo real:
Supabase Realtime

Control de versiones:
Git y GitHub

Plataforma futura:
Android, con posibilidad de publicarse mas adelante en Play Store.


3. FASE 1: PROTOTIPO FUNCIONAL
------------------------------

La primera fase no busca tener arte profesional ni muchas mecanicas. Primero debe funcionar el flujo principal del juego.

El prototipo debe tener:

- Pantalla de inicio.
- Pantalla de instrucciones.
- Crear sala.
- Unirse a sala con codigo.
- Sala de espera.
- Jugadores simulados.
- Selector de rol para probar Piloto, Analista e Ingeniero.
- Mostrar pantalla diferente segun el rol.
- Temporizador.
- Retos aleatorios simulados.
- Barra de energia.
- Sistema de errores.
- Validar si la respuesta es correcta o incorrecta.
- Pantalla de resultado: ganaron o perdieron.
- Resumen final con energia restante y errores.


4. ROLES DEL JUEGO
------------------

Rol 1: Piloto / Operador

Es el jugador que ve la consola de la nave.

Puede ver informacion como:

- Sistema danado: Oxigeno
- Codigo: A7X
- Simbolo: Luna
- Cables: rojo, azul, amarillo
- Botones: izquierdo, centro, derecho
- Energia restante

Su trabajo:
Describir lo que ve y ejecutar la accion final.


Rol 2: Analista

Es el jugador que ve reglas generales.

Ejemplo de informacion:

- Si el simbolo es Luna, revisa si el codigo contiene el numero 7.
- Si el simbolo es Sol, revisa el color del primer cable.
- Si el simbolo es Estrella, pregunta por el sistema danado.

Su trabajo:
Interpretar la primera parte de la pista y orientar al equipo.


Rol 3: Ingeniero

Es el jugador que ve reglas tecnicas.

Ejemplo de informacion:

- Si el sistema es Oxigeno y el codigo contiene 7, presiona el boton derecho.
- Si el sistema es Motor y hay cable rojo, activa el interruptor central.
- Si el sistema es Escudos y el simbolo es Luna, corta el cable azul.

Su trabajo:
Dar la instruccion final usando la informacion del Piloto y del Analista.


5. FLUJO GENERAL DEL JUEGO
--------------------------

1. El jugador abre la app.
2. Puede elegir crear una sala o unirse a una sala.
3. Si crea una sala, el sistema genera un codigo.
4. Los otros jugadores entran usando ese codigo.
5. La sala espera hasta tener 3 jugadores.
6. Cuando hay 3 jugadores, se asignan los roles.
7. Empieza la partida con temporizador.
8. Cada jugador ve informacion diferente.
9. Los jugadores se comunican fuera o dentro del juego para resolver el reto.
10. El Piloto ejecuta la accion final.
11. Si la respuesta es correcta, ganan.
12. Si la respuesta es incorrecta o se acaba el tiempo, pierden.


6. RETOS DEL PROTOTIPO
----------------------

La version actual ya no usa un solo reto fijo. El juego elige un reto aleatorio al iniciar la partida.

Reto 1:

- Sistema: Oxigeno
- Codigo: A7X
- Simbolo: Luna
- Botones: izquierdo, centro, derecho
- Respuesta correcta: boton derecho

Reto 2:

- Sistema: Motor
- Codigo: M3B
- Simbolo: Sol
- Botones: izquierdo, centro, derecho
- Respuesta correcta: boton centro

Reto 3:

- Sistema: Escudos
- Codigo: E9K
- Simbolo: Estrella
- Botones: izquierdo, centro, derecho
- Respuesta correcta: boton izquierdo

Ejemplo de informacion por rol:

Pantalla del Piloto:

- Sistema: Oxigeno
- Codigo: A7X
- Simbolo: Luna
- Botones disponibles: izquierdo, centro, derecho

Pantalla del Analista:

- Si el simbolo es Luna, revisa si el codigo contiene el numero 7.

Pantalla del Ingeniero:

- Si el sistema es Oxigeno y el codigo contiene 7, presiona el boton derecho.

Solucion:
El Piloto debe presionar el boton derecho.

La logica actual permite que la respuesta correcta cambie dependiendo del reto elegido.


7. ESTRUCTURA INICIAL DE ARCHIVOS DART
--------------------------------------

La carpeta principal del proyecto deberia llamarse:

nebula_crew/

La estructura inicial dentro de lib/ seria:

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

Total inicial:
18 archivos .dart


8. FUNCION DE CADA ARCHIVO
--------------------------

main.dart
Archivo principal de la app. Define MaterialApp, tema y rutas.

screens/pantalla_inicio.dart
Pantalla inicial con botones para crear sala, unirse o ver como jugar.

screens/pantalla_instrucciones.dart
Pantalla que explica la mecanica del juego: cada jugador tiene informacion distinta y deben comunicarse para resolver el reto.

screens/pantalla_crear_sala.dart
Pantalla donde el jugador escribe su nombre y crea una sala.

screens/pantalla_unirse_sala.dart
Pantalla donde el jugador escribe su nombre y el codigo de sala.

screens/pantalla_espera.dart
Pantalla que muestra el codigo de sala y los jugadores conectados.

screens/pantalla_juego.dart
Pantalla principal de partida. Cambia su contenido segun el rol del jugador.

screens/pantalla_resultado.dart
Pantalla final que muestra si el equipo gano o perdio.

models/jugador.dart
Modelo para representar a un jugador.

models/sala.dart
Modelo para representar una sala.

models/reto.dart
Modelo para representar el reto de la partida.

services/supabase_service.dart
Archivo para configurar e inicializar Supabase.

services/sala_service.dart
Funciones para crear, buscar y actualizar salas.

services/jugador_service.dart
Funciones para unir jugadores a una sala, obtener jugadores y asignar roles.

services/juego_service.dart
Funciones para crear retos, validar respuestas y actualizar resultado.

widgets/boton_principal.dart
Boton reutilizable para mantener el mismo estilo visual.

widgets/tarjeta_info.dart
Tarjeta reutilizable para mostrar informacion del juego.

widgets/temporizador_widget.dart
Widget reutilizable que muestra el tiempo restante. Si el tiempo llega a cero, la partida se pierde.

widgets/barra_energia_widget.dart
Widget reutilizable que muestra la energia de la nave y los errores cometidos.


9. BASE DE DATOS INICIAL EN SUPABASE
------------------------------------

Tablas planeadas:

salas
- id
- codigo
- estado
- created_at

jugadores
- id
- sala_id
- nombre
- rol
- created_at

retos
- id
- sala_id
- sistema
- codigo
- simbolo
- cable_1
- cable_2
- cable_3
- respuesta_correcta
- estado
- created_at

Estados posibles de una sala:

- esperando
- jugando
- ganada
- perdida

Roles posibles:

- piloto
- analista
- ingeniero


10. SQL INICIAL PROPUESTO
-------------------------

create table salas (
  id uuid primary key default gen_random_uuid(),
  codigo text unique not null,
  estado text not null default 'esperando',
  created_at timestamp default now()
);

create table jugadores (
  id uuid primary key default gen_random_uuid(),
  sala_id uuid references salas(id) on delete cascade,
  nombre text not null,
  rol text,
  created_at timestamp default now()
);

create table retos (
  id uuid primary key default gen_random_uuid(),
  sala_id uuid references salas(id) on delete cascade,
  sistema text not null,
  codigo text not null,
  simbolo text not null,
  cable_1 text,
  cable_2 text,
  cable_3 text,
  respuesta_correcta text not null,
  estado text not null default 'activo',
  created_at timestamp default now()
);


11. ORDEN RECOMENDADO DE DESARROLLO
-----------------------------------

Paso 1:
Crear el proyecto Flutter.

Comando:
flutter create nebula_crew

Paso 2:
Entrar a la carpeta.

Comando:
cd nebula_crew

Paso 3:
Inicializar Git si Flutter no lo dejo listo.

Comando:
git init

Paso 4:
Crear las carpetas:

- lib/screens
- lib/models
- lib/services
- lib/widgets
- assets/images
- assets/icons

Paso 5:
Crear las pantallas vacias y la navegacion.

Paso 6:
Crear modelos basicos: Jugador, Sala y Reto.

Paso 7:
Crear servicios falsos o temporales sin Supabase para probar la app.

Paso 8:
Conectar Supabase.

Paso 9:
Crear la funcion de crear sala.

Paso 10:
Crear la funcion de unirse a sala.

Paso 11:
Mostrar jugadores conectados en sala de espera.

Paso 12:
Asignar roles al llegar a 3 jugadores.

Paso 13:
Mostrar pantalla de juego diferente segun el rol.

Paso 14:
Crear el reto inicial.

Paso 15:
Validar respuesta y mostrar resultado.

Paso 16:
Agregar temporizador, energia, errores y resumen final.

Paso 17:
Agregar retos aleatorios simulados.

Paso 18:
Preparar Supabase para la siguiente fase.


12. CARPETA DONDE CONVIENE GUARDAR EL PROYECTO
----------------------------------------------

Se recomienda guardar el proyecto en una carpeta dedicada a proyectos de programacion.

En Windows podria ser:

C:\Users\TU_USUARIO\Documents\Proyectos\nebula_crew

Mejor sin espacios ni acentos:

C:\Users\TU_USUARIO\Documents\Proyectos\nebula_crew

Otra opcion:

C:\Users\TU_USUARIO\Desktop\Proyectos\nebula_crew

Recomendacion:
No guardarlo dentro de Descargas, porque esa carpeta se desordena facil y se pueden borrar archivos por accidente.

La carpeta raiz del proyecto debe contener:

- lib/
- assets/
- pubspec.yaml
- README.txt
- .gitignore


13. GIT Y GITHUB
----------------

Primer commit recomendado:

git add .
git commit -m "Crear estructura inicial del proyecto"

Commits futuros recomendados:

git commit -m "Agregar pantallas iniciales"
git commit -m "Agregar modelos principales"
git commit -m "Agregar navegacion entre pantallas"
git commit -m "Agregar estructura de servicios"
git commit -m "Agregar formularios para crear y unirse a sala"
git commit -m "Agregar pantalla de espera simulada"
git commit -m "Agregar pantalla de juego por roles"
git commit -m "Agregar temporizador de partida"
git commit -m "Agregar energia y errores de partida"
git commit -m "Agregar retos aleatorios simulados"
git commit -m "Conectar Supabase"
git commit -m "Agregar creacion de salas"
git commit -m "Agregar union a salas"
git commit -m "Agregar asignacion de roles"
git commit -m "Agregar reto inicial"


14. ARTE DEL JUEGO
------------------

Para la primera fase no se necesita saber dibujar.

Se puede iniciar con:

- Texto
- Botones
- Colores
- Iconos de Flutter
- Tarjetas simples
- Emojis si se desea

Despues se puede mejorar con:

- Assets gratuitos
- Iconos
- Imagenes generadas con IA
- Dibujos 2D simples
- Renders 3D convertidos a imagen PNG

Prioridad:
Primero debe funcionar el juego. El arte se mejora despues.


15. MONETIZACION FUTURA
-----------------------

Si el juego se publica mas adelante en Play Store, una estrategia recomendable seria:

- Juego gratis.
- Anuncios solo entre partidas, no durante la partida.
- Compras opcionales de cosmeticos.
- Temas visuales de nave.
- Avatares.
- Paquetes de misiones.

No se recomienda pay-to-win.

La primera version debe enfocarse en que el juego sea divertido y funcional.


16. ESTADO ACTUAL DEL PROTOTIPO
-------------------------------

El proyecto ya tiene una primera version local/simulada funcionando.

Actualmente incluye:

- Proyecto Flutter creado.
- Repositorio GitHub conectado.
- Pantalla de inicio.
- Pantalla de instrucciones.
- Pantalla para crear sala.
- Pantalla para unirse a sala.
- Botones para limpiar campos de texto.
- Sala de espera simulada.
- Lista de 3 jugadores simulados.
- Selector de rol para probar Piloto, Analista e Ingeniero.
- Pantalla de juego que cambia segun el rol.
- Retos aleatorios simulados.
- Temporizador de 60 segundos.
- Barra visual de energia.
- Sistema de errores.
- Mision actual segun el sistema danado.
- Resultado de victoria o derrota.
- Resumen final con energia restante y errores.

La app todavia no esta conectada a Supabase. Por ahora las salas, jugadores y retos son simulados en codigo.

El flujo actual del prototipo es:

1. Entrar a la app.
2. Crear sala o unirse a una sala.
3. Llegar a sala de espera.
4. Elegir un rol para pruebas.
5. Iniciar partida.
6. Ver informacion diferente segun el rol.
7. Resolver el reto antes de que termine el tiempo.
8. Ganar, perder por error, perder por energia o perder por tiempo.


17. SIGUIENTE FASE
------------------

La siguiente fase sera conectar Supabase.

Objetivos de la siguiente fase:

- Crear tablas reales en Supabase.
- Guardar salas reales con codigo.
- Permitir que jugadores entren desde diferentes dispositivos.
- Mostrar jugadores conectados en tiempo real.
- Asignar roles automaticamente cuando haya 3 jugadores.
- Guardar el reto de la sala en base de datos.
- Sincronizar resultado, errores, energia y temporizador.
- Hacer que cada jugador vea solo la informacion de su rol.

Antes de conectar Supabase, el prototipo local debe seguir funcionando sin errores.


18. RESUMEN PARA OTRA IA
------------------------

El usuario quiere crear un juego movil cooperativo en Flutter llamado provisionalmente Nebula Crew.

El juego sera para 3 jugadores. Cada jugador entra a una sala usando un codigo. Cuando hay 3 jugadores, el sistema asigna roles: Piloto, Analista e Ingeniero.

El Piloto ve la consola de la nave, el Analista ve pistas generales y el Ingeniero ve reglas tecnicas. Los jugadores deben comunicarse para resolver un reto antes de que termine el temporizador.

La primera fase es un prototipo simple, sin login y sin arte complejo. Actualmente usa datos simulados: salas simuladas, jugadores simulados y retos aleatorios simulados. La app usara Flutter para el frontend y Supabase para base de datos y tiempo real en la siguiente fase.

El objetivo inicial no es hacer el juego completo, sino lograr que tres jugadores puedan entrar a una sala, recibir roles diferentes, ver informacion distinta y resolver un reto cooperativo.

Estado actual importante:
Ya existe navegacion, pantalla de instrucciones, crear sala, unirse a sala, sala de espera simulada, selector de rol, pantalla de juego por roles, temporizador, barra de energia, errores, retos aleatorios y pantalla de resultado con resumen.
