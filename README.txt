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
- Crear sala.
- Unirse a sala con codigo.
- Sala de espera.
- Esperar hasta que entren 3 jugadores.
- Asignar roles automaticamente.
- Mostrar pantalla diferente segun el rol.
- Temporizador.
- Un reto sencillo.
- Validar si la respuesta es correcta o incorrecta.
- Pantalla de resultado: ganaron o perdieron.


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


6. RETO INICIAL DEL PROTOTIPO
-----------------------------

Para la primera version se recomienda usar un solo reto fijo.

Datos del reto:

- Sistema: Oxigeno
- Codigo: A7X
- Simbolo: Luna
- Botones: izquierdo, centro, derecho
- Respuesta correcta: boton derecho

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


7. ESTRUCTURA INICIAL DE ARCHIVOS DART
--------------------------------------

La carpeta principal del proyecto deberia llamarse:

nebula_crew/

La estructura inicial dentro de lib/ seria:

lib/
  main.dart

  screens/
    pantalla_inicio.dart
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

Total inicial:
16 archivos .dart


8. FUNCION DE CADA ARCHIVO
--------------------------

main.dart
Archivo principal de la app. Define MaterialApp, tema y rutas.

screens/pantalla_inicio.dart
Pantalla inicial con botones para crear sala o unirse.

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


16. RESUMEN PARA OTRA IA
------------------------

El usuario quiere crear un juego movil cooperativo en Flutter llamado provisionalmente Nebula Crew.

El juego sera para 3 jugadores. Cada jugador entra a una sala usando un codigo. Cuando hay 3 jugadores, el sistema asigna roles: Piloto, Analista e Ingeniero.

El Piloto ve la consola de la nave, el Analista ve pistas generales y el Ingeniero ve reglas tecnicas. Los jugadores deben comunicarse para resolver un reto antes de que termine el temporizador.

La primera fase debe ser un prototipo simple, sin login, sin arte complejo y con un solo reto fijo. La app usara Flutter para el frontend y Supabase para base de datos y tiempo real.

El objetivo inicial no es hacer el juego completo, sino lograr que tres jugadores puedan entrar a una sala, recibir roles diferentes, ver informacion distinta y resolver un reto cooperativo.
