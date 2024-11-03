% ruta(Ubicacion1, Ubicacion2, Distancia, Tiempo, Semaforo).
% Rutas originales
ruta(a, b, 5, 10, true).
ruta(a, c, 7, 15, false).
ruta(b, d, 3, 7, true).
ruta(c, d, 4, 10, false).
ruta(c, e, 6, 12, true).
ruta(d, e, 2, 5, false).

semaforo(a, b).

% Rutas inversas
% ruta(b, a, 5, 10, true).
% ruta(c, a, 7, 15, false).
% ruta(d, b, 3, 7, true).
% ruta(d, c, 4, 10, false).
% ruta(e, c, 6, 12, true).
% ruta(e, d, 2, 5, false).

% mi_member(Elemento, Lista)
mi_member(X, [X|_]).
mi_member(X, [_|T]) :-
    mi_member(X, T).

% camino(UbicacionInicial, UbicacionFinal, Camino, DistanciaTotal, TiempoTotal, Semaforos)
camino(Inicio, Fin, [Inicio|Ruta], DistanciaTotal, TiempoTotal, Semaforos) :-
    camino_aux(Inicio, Fin, [Inicio], Ruta, 0, 0, DistanciaTotal, TiempoTotal, 0, Semaforos).

% camino_aux es una regla auxiliar que acumula la distancia, el tiempo y los semáforos
camino_aux(Ubicacion, Ubicacion, _, [], Distancia, Tiempo, Distancia, Tiempo, Semaforos, Semaforos).

camino_aux(Inicio, Fin, Visitados, [Siguiente|Ruta], DistanciaAcum, TiempoAcum, DistanciaTotal, TiempoTotal, SemaforosAcum, SemaforosTotal) :-
    ruta(Inicio, Siguiente, DistanciaPaso, TiempoPaso, Semaforo),
    \+ mi_member(Siguiente, Visitados),  % evita ciclos
    NuevaDistancia is DistanciaAcum + DistanciaPaso,
    NuevoTiempo is TiempoAcum + TiempoPaso,
    (Semaforo -> NuevoSemaforos is SemaforosAcum + 1 ; NuevoSemaforos is SemaforosAcum),
    camino_aux(Siguiente, Fin, [Siguiente|Visitados], Ruta, NuevaDistancia, NuevoTiempo, DistanciaTotal, TiempoTotal, NuevoSemaforos, SemaforosTotal).

% ruta_mas_corta(UbicacionInicial, UbicacionFinal, Camino, Distancia, Tiempo)
ruta_mas_corta(Inicio, Fin, Camino, Distancia, Tiempo) :-
    bagof((C, D, T), camino(Inicio, Fin, C, D, T, _), Rutas),
    min_distancia(Rutas, (Camino, Distancia, Tiempo)).

% min_distancia(ListaDeRutas, RutaMinima)
min_distancia([Ruta], Ruta).
min_distancia([(C1, D1, T1), (C2, D2, T2) | Rutas], MinRuta) :-
    D1 =< D2,
    min_distancia([(C1, D1, T1) | Rutas], MinRuta).
min_distancia([(C1, D1, T1), (C2, D2, T2) | Rutas], MinRuta) :-
    D1 > D2,
    min_distancia([(C2, D2, T2) | Rutas], MinRuta).

% ruta_menos_semaforos(UbicacionInicial, UbicacionFinal, Camino, Distancia, Tiempo, Semaforos)
ruta_menos_semaforos(Inicio, Fin, Camino, Distancia, Tiempo, Semaforos) :-
    bagof((C, D, T, S), camino(Inicio, Fin, C, D, T, S), Rutas),
    min_semaforos(Rutas, (Camino, Distancia, Tiempo, Semaforos)).

% min_semaforos(ListaDeRutas, RutaMinima)
min_semaforos([Ruta], Ruta).
min_semaforos([(C1, D1, T1, S1), (C2, D2, T2, S2) | Rutas], MinRuta) :-
    S1 =< S2,
    min_semaforos([(C1, D1, T1, S1) | Rutas], MinRuta).
min_semaforos([(C1, D1, T1, S1), (C2, D2, T2, S2) | Rutas], MinRuta) :-
    S1 > S2,
    min_semaforos([(C2, D2, T2, S2) | Rutas], MinRuta).