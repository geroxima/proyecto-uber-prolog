% calle(nombre, intersección_origen, intersección_destino, sentido, distancia, semáforos, tráfico).
calle('Av. Japón',      'A1', 'A2', unico, 1, 2, 1).
calle('Av. Caballero',  'A2', 'A3', doble, 1, 1, 1).
calle('Calle 6',        'A3', 'A6', unico, 1, 1, 1).
calle('Calle 7',        'A6', 'A5', unico, 1, 0, 1).
calle('Av. Francia',    'A5', 'A4', unico, 1, 3, 1).
calle('Av. España',     'A5', 'A1', unico, 1, 1, 1).
calle('Av. Brasil',     'A4', 'A1', unico, 1, 1, 1).
calle('Av. Caballero',  'A2', 'A5', unico, 1, 1, 1).

% Ruta base entre dos intersecciones, recursiva.
ruta(Origen, Destino, [Origen|Ruta], Distancia, Semaforos, TraficoTotal) :-
    (calle(_, Origen, Intermedio, Sentido, Distancia1, Semaforos1, Trafico1) ;
     calle(_, Intermedio, Origen, doble, Distancia1, Semaforos1, Trafico1)),
    (Sentido = unico ; Sentido = doble),
    ruta(Intermedio, Destino, Ruta, Distancia2, Semaforos2, Trafico2),
    Distancia is Distancia1 + Distancia2,
    Semaforos is Semaforos1 + Semaforos2,
    TraficoTotal is Trafico1 + Trafico2.

% Caso base: cuando el origen es el destino.
ruta(Destino, Destino, [Destino], 0, 0, 0).

% Ruta más corta
ruta_mas_corta(Origen, Destino, Ruta, Distancia) :-
    aggregate(min(D, R), ruta(Origen, Destino, R, D, _, _), min(Distancia, Ruta)).

% Ruta con menos tráfico
ruta_menos_transito(Origen, Destino, Ruta, Trafico) :-
    aggregate(min(T, R), ruta(Origen, Destino, R, _, _, T), min(Trafico, Ruta)).

% Ruta con menos semáforos
ruta_con_semaforos(Origen, Destino, Ruta, Semaforos) :-
    aggregate(min(S, R), ruta(Origen, Destino, R, _, S, _), min(Semaforos, Ruta)).

% Tarifa por kilómetro
tarifa_por_km(500). % Gs por kilómetro

% Costo del viaje
costo_viaje(Distancia, Costo) :-
    tarifa_por_km(Tarifa),
    Costo is Distancia * Tarifa.

% Comercio(nombre, intersección).
comercio('Supermercado Real', 'A3').