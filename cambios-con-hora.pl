:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true), max_depth(0), max_length(0)]).
:- set_prolog_flag(answer_write_options, [max_depth(0)]).

:- discontiguous ruta/7.
:- discontiguous ruta/6.

:- consult('mapa.pl').

mi_member(X, [X|_]).
mi_member(X, [_|T]) :-
    mi_member(X, T).

% longitud(Lista, Longitud)
longitud([], 0).
longitud([_|T], N) :-
    longitud(T, N1),
    N is N1 + 1.

% concatenar(Lista1, Lista2, Resultado)
concatenar([], L, L).
concatenar([H|T], L, [H|R]) :-
    concatenar(T, L, R).

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

% Obtener la ubicación correspondiente a un nombre de lugar
obtener_ubicacion(Nombre, Ubicacion) :-
    lugar(Nombre, Ubicacion), !.
obtener_ubicacion(Ubicacion, Ubicacion).


% Definir tarifa fija por kilómetro
tarifa_por_km(10). 

tarifa_base(8000).

% Helper predicate to get the traffic level based on the hour
traffic_level(Hora, T00_6, T7_12, T13_18, T19_24, Traffic) :-
    (Hora >= 0, Hora < 7), Traffic = T00_6.
traffic_level(Hora, T00_6, T7_12, T13_18, T19_24, Traffic) :-
    (Hora >= 7, Hora < 13), Traffic = T7_12.
traffic_level(Hora, T00_6, T7_12, T13_18, T19_24, Traffic) :-
    (Hora >= 13, Hora < 19), Traffic = T13_18.
traffic_level(Hora, T00_6, T7_12, T13_18, T19_24, Traffic) :-
    (Hora >= 19, Hora < 24), Traffic = T19_24.

% camino(UbicacionInicial, UbicacionFinal, Hora, Camino, DistanciaTotal, TiempoTotal, SemaforosTotal, ListaSemaforos, Precio)
% Predicado principal para calcular el camino y el precio

% Predicado principal para calcular el camino y el precio
camino(Inicio, Fin, Hora, [Inicio|Ruta], DistanciaTotal, TiempoTotal, SemaforosTotal, ListaSemaforos, Precio) :-
    camino_aux(Inicio, Fin, Hora, [Inicio], Ruta, 0, 0, 0, DistanciaTotal, TiempoTotal, SemaforosTotal, [], ListaSemaforos),
    calcular_precio(DistanciaTotal, TiempoTotal, Precio).

% Predicado auxiliar para calcular el precio en función de la distancia total
calcular_precio(DistanciaTotal, _, Precio) :-
    DistanciaTotal =< 1000,     % Si la distancia es de 1000 metros o menos
    tarifa_base(Precio).

calcular_precio(DistanciaTotal, TiempoTotal, Precio) :-
    DistanciaTotal > 1000,      % Si la distancia es mayor a 1000 metros
    tarifa_base(TarifaBase),
    tarifa_por_km(TarifaPorKm),
    DistanciaExtra is DistanciaTotal - 1000,            % Calcula el exceso de distancia
    PrecioExtra is (DistanciaExtra * TiempoTotal) / TarifaPorKm, % Calcula el costo adicional
    Precio is TarifaBase + PrecioExtra.                 % Suma la tarifa base con el costo adicional

% camino_aux es una regla auxiliar que acumula la distancia, el tiempo y los semaforos
camino_aux(Ubicacion, Ubicacion, _, _, [], Distancia, Tiempo, Semaforos, Distancia, Tiempo, Semaforos, ListaSemaforos, ListaSemaforos).

camino_aux(Inicio, Fin, Hora, Visitados, [Siguiente|Ruta], DistanciaAcum, TiempoAcum, SemaforosAcum, DistanciaTotal, TiempoTotal, SemaforosTotal, ListaSemaforosAcum, ListaSemaforos) :-
    ruta(Inicio, Siguiente, DistanciaPaso, T00_6, T7_12, T13_18, T19_24),
    traffic_level(Hora, T00_6, T7_12, T13_18, T19_24, TiempoPaso),
    \+ mi_member(Siguiente, Visitados),  % Evita ciclos
    NuevaDistancia is DistanciaAcum + DistanciaPaso,
    NuevaDistancia < 2000,  % Verifica si la distancia excede 2000
    % Caso cuando Siguiente es un semáforo
    semaforo(Siguiente),
    NuevoSemaforos is SemaforosAcum + 1,
    concatenar(ListaSemaforosAcum, [Siguiente], NuevaListaSemaforos),
    TiempoExtra is 1,
    NuevoTiempo is TiempoAcum + TiempoPaso + TiempoExtra,
    camino_aux(Siguiente, Fin, Hora, [Siguiente|Visitados], Ruta, NuevaDistancia, NuevoTiempo, NuevoSemaforos, DistanciaTotal, TiempoTotal, SemaforosTotal, NuevaListaSemaforos, ListaSemaforos).

camino_aux(Inicio, Fin, Hora, Visitados, [Siguiente|Ruta], DistanciaAcum, TiempoAcum, SemaforosAcum, DistanciaTotal, TiempoTotal, SemaforosTotal, ListaSemaforosAcum, ListaSemaforos) :-
    ruta(Inicio, Siguiente, DistanciaPaso, T00_6, T7_12, T13_18, T19_24),
    traffic_level(Hora, T00_6, T7_12, T13_18, T19_24, TiempoPaso),
    \+ mi_member(Siguiente, Visitados),  % Evita ciclos
    NuevaDistancia is DistanciaAcum + DistanciaPaso,
    NuevaDistancia < 2000,  % Verifica si la distancia excede 2000
    % Caso cuando Siguiente no es un semáforo
    \+ semaforo(Siguiente),
    NuevoSemaforos is SemaforosAcum,
    NuevaListaSemaforos = ListaSemaforosAcum,
    TiempoExtra is 0,
    NuevoTiempo is TiempoAcum + TiempoPaso + TiempoExtra,
    camino_aux(Siguiente, Fin, Hora, [Siguiente|Visitados], Ruta, NuevaDistancia, NuevoTiempo, NuevoSemaforos, DistanciaTotal, TiempoTotal, SemaforosTotal, NuevaListaSemaforos, ListaSemaforos).

% ruta_mas_corta(UbicacionInicial, UbicacionFinal, Hora, Camino, Distancia, Tiempo, Precio)
ruta_mas_corta(Inicio, Fin, Hora, Camino, Distancia, Tiempo, Precio) :-
    bagof((C, D, T, S, L, P), camino(Inicio, Fin, Hora, C, D, T, S, L, P), Rutas),
    min_distancia(Rutas, (Camino, Distancia, Tiempo, _, _, Precio)).

% min_distancia(ListaDeRutas, RutaMinima)
min_distancia([Ruta], Ruta).
min_distancia([(C1, D1, T1, S1, L1, P1), (_, D2, _, _, _, _) | Rutas], MinRuta) :-
    D1 =< D2,
    min_distancia([(C1, D1, T1, S1, L1, P1) | Rutas], MinRuta).

min_distancia([(_, D1, _, _, _, _), (C2, D2, T2, S2, L2, P2) | Rutas], MinRuta) :-
    D1 > D2,
    min_distancia([(C2, D2, T2, S2, L2, P2) | Rutas], MinRuta).


% min_semaforos(ListaDeRutas, RutaMinima)
min_semaforos([Ruta], Ruta).
min_semaforos([(C1, D1, T1, S1, L1, P1), (_, _, _, S2, _, -) | Rutas], MinRuta) :-
    S1 =< S2,
    min_semaforos([(C1, D1, T1, S1, L1, P1) | Rutas], MinRuta).
min_semaforos([(_, _, _, S1, _, _), (C2, D2, T2, S2, L2, P2) | Rutas], MinRuta) :-
    S1 > S2,
    min_semaforos([(C2, D2, T2, S2, L2, P2) | Rutas], MinRuta).

imprimir_rutas([]).
imprimir_rutas([(Camino, Distancia, Tiempo, Semaforos, ListaSemaforos, Precio) | Rutas]) :-
    format('------------~n'),
    format('🏁 Camino: ~w~n', [Camino]),
    format('📏 Distancia: ~w metros~n', [Distancia]),
    format('⏳ Tiempo: ~w~n', [Tiempo]),
    format('🚦 Semaforos: ~w~n', [Semaforos]),
    format('🚧 Intersecciones con semaforos: ~w~n', [ListaSemaforos]),
    format('💸 Precio: ~2f Gs~n', [Precio]),
    imprimir_rutas(Rutas).

% viaje(UbicacionInicial, UbicacionFinal, Hora, MejoresRutas)
viaje(Inicio, Fin, Hora, MejoresRutas) :-
    bagof((C, D, T, S, L, P), camino(Inicio, Fin, Hora, C, D, T, S, L, P), Rutas),
    sort(2, @=<, Rutas, RutasOrdenadas),  % Ordenar rutas por distancia
    sublist(RutasOrdenadas, MejoresRutas, 0, 3).  % Seleccionar las tres primeras rutas

% Modificar el predicado viajar/3 para aceptar nombres de lugares
viajar(Inicio, Fin, Hora) :-
    obtener_ubicacion(Inicio, UbicacionInicio),
    obtener_ubicacion(Fin, UbicacionFin),
    format('Rutas desde ~w hasta ~w a las ~w hs~n', [Inicio, Fin, Hora]),
    viaje(UbicacionInicio, UbicacionFin, Hora, MejoresRutas),
    imprimir_rutas(MejoresRutas).