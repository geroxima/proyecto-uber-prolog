:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true), max_depth(0), max_length(0)]).
:- set_prolog_flag(answer_write_options, [max_depth(0)]).

:- consult('mapa-sin-hora.pl').

% mi_member(Elemento, Lista)
mi_member(X, [X|_]).
mi_member(X, [_|T]) :-
    mi_member(X, T).

% sublist(Lista, SubLista, Inicio, Longitud)
sublist(Lista, SubLista, Inicio, Longitud) :-
    longitud(Prefix, Inicio),
    concatenar(Prefix, Rest, Lista),
    longitud(SubLista, Longitud),
    concatenar(SubLista, _, Rest).

% count_semaforos(Camino, Cantidad)
% Caso base: cuando la lista está vacía, la cantidad de semáforos es 0.
count_semaforos([], 0).

% Caso cuando el primer nodo es un semáforo:
count_semaforos([Nodo|Resto], Cantidad) :-
    semaforo(Nodo),            % Verifica si el nodo es un semáforo
    count_semaforos(Resto, CantidadResto),
    Cantidad is CantidadResto + 1.

% Caso cuando el primer nodo no es un semáforo:
count_semaforos([Nodo|Resto], Cantidad) :-
    \+ semaforo(Nodo),         % Verifica que el nodo no es un semáforo
    count_semaforos(Resto, Cantidad).
% Definir tarifa fija por kilómetro
tarifa_por_km(10). 


% camino(UbicacionInicial, UbicacionFinal, Camino, DistanciaTotal, TiempoTotal, SemaforosTotal, ListaSemaforos, Precio)
camino(Inicio, Fin, [Inicio|Ruta], DistanciaTotal, TiempoTotal, SemaforosTotal, ListaSemaforos, Precio) :-
    camino_aux(Inicio, Fin, [Inicio], Ruta, 0, 0, 0, DistanciaTotal, TiempoTotal, SemaforosTotal, [], ListaSemaforos),
    tarifa_por_km(Tarifa),
    Precio is DistanciaTotal * Tarifa.

% camino_aux es una regla auxiliar que acumula la distancia, el tiempo y los semaforos
camino_aux(Ubicacion, Ubicacion, _, [], Distancia, Tiempo, Semaforos, Distancia, Tiempo, Semaforos, ListaSemaforos, ListaSemaforos).

camino_aux(Inicio, Fin, Visitados, [Siguiente|Ruta], DistanciaAcum, TiempoAcum, SemaforosAcum, DistanciaTotal, TiempoTotal, SemaforosTotal, ListaSemaforosAcum, ListaSemaforos) :-
    ruta(Inicio, Siguiente, DistanciaPaso, TiempoPaso),
    \+ mi_member(Siguiente, Visitados),  % Evita ciclos
    NuevaDistancia is DistanciaAcum + DistanciaPaso,
    NuevaDistancia =< 2000,  % Verifica si la distancia excede 2000
    % Caso cuando Siguiente es un semáforo
    semaforo(Siguiente),
    NuevoSemaforos is SemaforosAcum + 1,
    append(ListaSemaforosAcum, [Siguiente], NuevaListaSemaforos),
    TiempoExtra is 1,
    NuevoTiempo is TiempoAcum + TiempoPaso + TiempoExtra,
    camino_aux(Siguiente, Fin, [Siguiente|Visitados], Ruta, NuevaDistancia, NuevoTiempo, NuevoSemaforos, DistanciaTotal, TiempoTotal, SemaforosTotal, NuevaListaSemaforos, ListaSemaforos).

camino_aux(Inicio, Fin, Visitados, [Siguiente|Ruta], DistanciaAcum, TiempoAcum, SemaforosAcum, DistanciaTotal, TiempoTotal, SemaforosTotal, ListaSemaforosAcum, ListaSemaforos) :-
    ruta(Inicio, Siguiente, DistanciaPaso, TiempoPaso),
    \+ mi_member(Siguiente, Visitados),  % Evita ciclos
    NuevaDistancia is DistanciaAcum + DistanciaPaso,
    NuevaDistancia =< 2000,  % Verifica si la distancia excede 2000
    % Caso cuando Siguiente no es un semáforo
    \+ semaforo(Siguiente),
    NuevoSemaforos is SemaforosAcum,
    NuevaListaSemaforos = ListaSemaforosAcum,
    TiempoExtra is 0,
    NuevoTiempo is TiempoAcum + TiempoPaso + TiempoExtra,
    camino_aux(Siguiente, Fin, [Siguiente|Visitados], Ruta, NuevaDistancia, NuevoTiempo, NuevoSemaforos, DistanciaTotal, TiempoTotal, SemaforosTotal, NuevaListaSemaforos, ListaSemaforos).

% ruta_mas_corta(UbicacionInicial, UbicacionFinal, Camino, Distancia, Tiempo, Precio)
ruta_mas_corta(Inicio, Fin, Camino, Distancia, Tiempo, Precio) :-
    bagof((C, D, T, S, L, P), camino(Inicio, Fin, C, D, T, S, L, P), Rutas),
    min_distancia(Rutas, (Camino, Distancia, Tiempo, _, _, Precio)).

% ruta_menos_semaforos(UbicacionInicial, UbicacionFinal, Camino, Distancia, Tiempo, Semaforos, ListaSemaforos, Precio)
ruta_menos_semaforos(Inicio, Fin, Camino, Distancia, Tiempo, Semaforos, ListaSemaforos, Precio) :-
    bagof((C, D, T, S, L, P), camino(Inicio, Fin, C, D, T, S, L, P), Rutas),
    min_semaforos(Rutas, (Camino, Distancia, Tiempo, Semaforos, ListaSemaforos, Precio)).

% min_distancia(ListaDeRutas, RutaMinima)
min_distancia([Ruta], Ruta).
min_distancia([(C1, D1, T1, S1, L1, P1), (C2, D2, T2, S2, L2, P2) | Rutas], MinRuta) :-
    D1 =< D2,
    min_distancia([(C1, D1, T1, S1, L1, P1) | Rutas], MinRuta).
min_distancia([(C1, D1, T1, S1, L1, P1), (C2, D2, T2, S2, L2, P2) | Rutas], MinRuta) :-
    D1 > D2,
    min_distancia([(C2, D2, T2, S2, L2, P2) | Rutas], MinRuta).

% min_semaforos(ListaDeRutas, RutaMinima)
min_semaforos([Ruta], Ruta).
min_semaforos([(C1, D1, T1, S1, L1, P1), (C2, D2, T2, S2, L2, P2) | Rutas], MinRuta) :-
    S1 =< S2,
    min_semaforos([(C1, D1, T1, S1, L1, P1) | Rutas], MinRuta).
min_semaforos([(C1, D1, T1, S1, L1, P1), (C2, D2, T2, S2, L2, P2) | Rutas], MinRuta) :-
    S1 > S2,
    min_semaforos([(C2, D2, T2, S2, L2, P2) | Rutas], MinRuta).

% viaje(UbicacionInicial, UbicacionFinal, Rutas)
viaje(Inicio, Fin, MejoresRutas) :-
    bagof((C, D, T, S, L, P), camino(Inicio, Fin, C, D, T, S, L, P), Rutas),
    sort(2, @=<, Rutas, RutasOrdenadas),  % Ordenar rutas por distancia
    sublist(RutasOrdenadas, MejoresRutas, 0, 3).  % Seleccionar las tres primeras rutas


% sublist(Lista, SubLista, Inicio, Longitud)
% longitud(Lista, Longitud)
longitud([], 0).
longitud([_|T], N) :-
    longitud(T, N1),
    N is N1 + 1.

% concatenar(Lista1, Lista2, Resultado)
concatenar([], L, L).
concatenar([H|T], L, [H|R]) :-
    concatenar(T, L, R).


% imprimir_rutas(ListaDeRutas)
imprimir_rutas([]).
imprimir_rutas([(Camino, Distancia, Tiempo, Semaforos, ListaSemaforos, Precio) | Rutas]) :-
    format('------------~n'),
    format('Camino: ~w~n', [Camino]),
    format('Distancia: ~w~n', [Distancia]),
    format('Tiempo: ~w~n', [Tiempo]),
    format('Semaforos: ~w~n', [Semaforos]),
    format('Intersecciones con semaforos: ~w~n', [ListaSemaforos]),
    format('Precio: ~2f Gs~n', [Precio]),
    imprimir_rutas(Rutas).


% viaje_imprimir(UbicacionInicial, UbicacionFinal)
viaje_imprimir(Inicio, Fin) :-
    viaje(Inicio, Fin, MejoresRutas),
    imprimir_rutas(MejoresRutas).

