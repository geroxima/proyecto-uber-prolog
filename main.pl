% Definición de calles y sus intersecciones
calle(a1, a2, 2, unico).
calle(a2, a3, 5, unico).
calle(a3, a6, 3, unico).
calle(a6, a5, 1, unico).
calle(a5, a4, 6, unico).
calle(a4, a1, 1, unico).
calle(a5, a1, 1, unico).
calle(a2, a5, 4, unico).

% Definición de semáforos
semaforo(b).
semaforo(d).

% Regla para encontrar una ruta entre dos puntos
ruta(X, Y, Distancia, [X, Y]) :- calle(X, Y, Distancia, _).
ruta(X, Y, Distancia, [X | R]) :-
    calle(X, Z, D1, _),
    ruta(Z, Y, D2, R),
    Distancia is D1 + D2.

% Regla para encontrar la ruta más corta
ruta_mas_corta(X, Y, Ruta, Distancia) :-
    setof((D, R), ruta(X, Y, D, R), [(Distancia, Ruta) | _]).

% Regla para contar semáforos en una ruta
contar_semaforos([], 0).
contar_semaforos([H | T], N) :-
    semaforo(H),
    contar_semaforos(T, N1),
    N is N1 + 1.
contar_semaforos([H | T], N) :-
    \+ semaforo(H),
    contar_semaforos(T, N).

% Regla para calcular el costo del viaje
costo_viaje(Distancia, Costo) :-
    Costo is Distancia * 1.5. % Ejemplo: costo de 1.5 unidades por km

% Ejemplo de uso
% ?- ruta_mas_corta(a, f, Ruta, Distancia), contar_semaforos(Ruta, Semaforos), costo_viaje(Distancia, Costo).