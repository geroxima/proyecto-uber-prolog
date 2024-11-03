:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true), max_depth(0), max_length(0)]).
:- set_prolog_flag(answer_write_options, [max_depth(0)]).

:- consult('mapa.pl').

% mi_member(Elemento, Lista)
mi_member(X, [X|_]).
mi_member(X, [_|T]) :-
    mi_member(X, T).

% camino(UbicacionInicial, UbicacionFinal, Hora, Camino, DistanciaTotal, TiempoTotal)
camino(Inicio, Fin, Hora, [Inicio|Ruta], DistanciaTotal, TiempoTotal) :-
    camino_aux(Inicio, Fin, Hora, [Inicio], Ruta, 0, 0, DistanciaTotal, TiempoTotal).

% camino_aux es una regla auxiliar que acumula la distancia y el tiempo
camino_aux(Ubicacion, Ubicacion, _, _, [], Distancia, Tiempo, Distancia, Tiempo).

camino_aux(Inicio, Fin, Hora, Visitados, [Siguiente|Ruta], DistanciaAcum, TiempoAcum, DistanciaTotal, TiempoTotal) :-
    ruta(Inicio, Siguiente, DistanciaPaso, TransitoDe0A6, TransitoDe7A12, TransitoDe13A18, TransitoDe19A00),
    \+ mi_member(Siguiente, Visitados),  % evita ciclos
    seleccionar_transito(Hora, TransitoDe0A6, TransitoDe7A12, TransitoDe13A18, TransitoDe19A00, TiempoPaso),
    NuevaDistancia is DistanciaAcum + DistanciaPaso,
    NuevoTiempo is TiempoAcum + TiempoPaso,
    camino_aux(Siguiente, Fin, Hora, [Siguiente|Visitados], Ruta, NuevaDistancia, NuevoTiempo, DistanciaTotal, TiempoTotal).

% Selecciona el tránsito para el rango de horas de 0 a 6
seleccionar_transito(Hora, TransitoDe0A6, _, _, _, TransitoSeleccionado) :-
    Hora >= 0, Hora < 6,
    TransitoSeleccionado = TransitoDe0A6.

% Selecciona el tránsito para el rango de horas de 7 a 12
seleccionar_transito(Hora, _, TransitoDe7A12, _, _, TransitoSeleccionado) :-
    Hora >= 7, Hora < 12,
    TransitoSeleccionado = TransitoDe7A12.

% Selecciona el tránsito para el rango de horas de 13 a 18
seleccionar_transito(Hora, _, _, TransitoDe13A18, _, TransitoSeleccionado) :-
    Hora >= 13, Hora < 18,
    TransitoSeleccionado = TransitoDe13A18.

% Selecciona el tránsito para el rango de horas de 19 a 23
seleccionar_transito(Hora, _, _, _, TransitoDe19A00, TransitoSeleccionado) :-
    Hora >= 19, Hora =< 23,
    TransitoSeleccionado = TransitoDe19A00.

% ruta_mas_corta(UbicacionInicial, UbicacionFinal, Hora, Camino, Distancia, Tiempo)
ruta_mas_corta(Inicio, Fin, Hora, Camino, Distancia, Tiempo) :-
    bagof((C, D, T), camino(Inicio, Fin, Hora, C, D, T), Rutas),
    min_distancia(Rutas, (Camino, Distancia, Tiempo)).

% min_distancia(ListaDeRutas, RutaMinima)
min_distancia([Ruta], Ruta).
min_distancia([(C1, D1, T1), (_, D2, _) | Rutas], MinRuta) :-
    D1 =< D2,
    min_distancia([(C1, D1, T1) | Rutas], MinRuta).
min_distancia([(_, D1, _), (C2, D2, T2) | Rutas], MinRuta) :-
    D1 > D2,
    min_distancia([(C2, D2, T2) | Rutas], MinRuta).
