:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true), max_depth(0), max_length(0)]).
:- set_prolog_flag(answer_write_options, [max_depth(0)]).

:- consult('mapa.pl').

% ruta(nodoA, nodoB, distancia, transitoDe0A6, transito de 7 a 12, transito de 13 a 18, transito de 19 a 00)



% mi_mi_member(Elemento, Lista)
mi_member(X, [X|_]).
mi_member(X, [_|T]) :-
    mi_member(X, T).

% camino(UbicacionInicial, UbicacionFinal, Camino, DistanciaTotal, TiempoTotal)
camino(Inicio, Fin, [Inicio|Ruta], DistanciaTotal, TiempoTotal) :-
    camino_aux(Inicio, Fin, [Inicio], Ruta, 0, 0, DistanciaTotal, TiempoTotal).

% camino_aux es una regla auxiliar que acumula la distancia y el tiempo
camino_aux(Ubicacion, Ubicacion, _, [], Distancia, Tiempo, Distancia, Tiempo).

camino_aux(Inicio, Fin, Visitados, [Siguiente|Ruta], DistanciaAcum, TiempoAcum, DistanciaTotal, TiempoTotal) :-
    ruta(Inicio, Siguiente, DistanciaPaso, TiempoPaso),
    \+ mi_member(Siguiente, Visitados),  % evita ciclos
    NuevaDistancia is DistanciaAcum + DistanciaPaso,
    NuevoTiempo is TiempoAcum + TiempoPaso,
    camino_aux(Siguiente, Fin, [Siguiente|Visitados], Ruta, NuevaDistancia, NuevoTiempo, DistanciaTotal, TiempoTotal).

% ruta_mas_corta(UbicacionInicial, UbicacionFinal, Camino, Distancia, Tiempo)
ruta_mas_corta(Inicio, Fin, Camino, Distancia, Tiempo) :-
    bagof((C, D, T), camino(Inicio, Fin, C, D, T), Rutas),
    min_distancia(Rutas, (Camino, Distancia, Tiempo)).

% min_distancia(ListaDeRutas, RutaMinima)
min_distancia([Ruta], Ruta).
min_distancia([(_, D1, _), (_, D2, _) | Rutas], MinRuta) :-
    D1 =< D2,
    min_distancia([(_, D1, _) | Rutas], MinRuta).
min_distancia([(_, D1, _), (C2, D2, T2) | Rutas], MinRuta) :-
    D1 > D2,
    min_distancia([(C2, D2, T2) | Rutas], MinRuta).

