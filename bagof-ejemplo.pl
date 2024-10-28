% ruta(Ubicacion1, Ubicacion2, Distancia, Tiempo).
% Rutas originales
ruta(a, b, 5, 10).
ruta(a, c, 7, 15).
ruta(b, d, 3, 7).
ruta(c, d, 4, 10).
ruta(c, e, 6, 12).
ruta(d, e, 2, 5).

% % Rutas inversas
% ruta(b, a, 5, 10).
% ruta(c, a, 7, 15).
% ruta(d, b, 3, 7).
% ruta(d, c, 4, 10).
% ruta(e, c, 6, 12).
% ruta(e, d, 2, 5).


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
min_distancia([(C1, D1, T1), (C2, D2, T2) | Rutas], MinRuta) :-
    D1 =< D2,
    min_distancia([(C1, D1, T1) | Rutas], MinRuta).
min_distancia([(C1, D1, T1), (C2, D2, T2) | Rutas], MinRuta) :-
    D1 > D2,
    min_distancia([(C2, D2, T2) | Rutas], MinRuta).

