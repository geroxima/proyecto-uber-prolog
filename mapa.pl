% ruta(inicio, fin, dis3ancia, 00-6, 7-12, 13-18, 19-24).
% Calles horizontales (de izquierda a derecha)
% calle('Av. Caballero ←→ ', [a0, b0, c0, d0, e0, f0, g0, h0, i0 , j0]).
% calle('Constitución Nacional ← ', [a1, b1, c1, d1, e1, f1, g1, h1, i1 , j1]).
% calle('25 de mayo → ', [a2, b2, c2, d2, e2, f2, g2, h2, i2 , j2]).
% calle('Villarica ← ', [a3, b3, c3, d3, e3, f3, g3, h3, i3 , j3]).
% calle('Tomás Romero Pereira → ', [a4, b4, c4, d4, e4, f4, g4, h4, i4, j4]).
% calle('14 de mayo ← ', [a5, b5, c5, d5, e5, f5, g5, h5, i5, j5]).
% calle('Cerro Corá → ', [a6, b6, c6, d6, e6, f6, g6, h6, i6, j6]).
% calle('Monseñor Wissen ← ', [a7, b7, c7, d7, e7, f7, g7, h7, i7, j7]).
% calle('Curupayty → ', [a8, b8, c8, d8, e8, f8, g8, h8, i8, j8]).

% calle('Av. Francia ↑↓ ', [a0, a1, a2, a3, a4, a5, a6, a7, a8]).
% calle('Antequera ↓ ', [b0, b1, b2, b3, b4, b5, b6, b7, b8]).
% calle('General Artigas ↑ ', [c0, c1, c2, c3, c4, c5, c6, c7, c8]).
% calle('Juan L. Mallorquín ↓ ', [d0, d1, d2, d3, d4, d5, d6, d7, d8]).
% calle('Mcal. Estigarribia ↑ ', [e0, e1, e2, e3, e4, e5, e6, e7, e8]).
% calle('Carlos A. López ↓ ', [f0, f1, f2, f3, f4, f5, f6, f7, f8]).
% calle('Lomas Valentinas ↑ ', [g0, g1, g2, g3, g4, g5, g6, g7, g8]).
% calle('Independencia Nacional ↓ ', [h0, h1, h2, h3, h4, h5, h6, h7, h8]).
% calle('Honorio Gonzáles ↑ ', [i0, i1, i2, i3, i4, i5, i6, i7, i8]).
% calle('Av. Irrazábal ↑↓ ', [j0, j1, j2, j3, j4, j5, j6, j7, j8]).

lugar('McDonalds', a7).
lugar('Plaza De Armas', d5).
lugar('Pizza Cheff', b4).
lugar('Clinica Tajy', c3).
lugar('Pizza Hut', b7).
lugar('Hiroshima Restaurante', g2).


ruta(x0, a0, 100, 1, 3, 2, 1).

ruta(x3, a3, 100, 1, 3, 2, 1).

ruta(x4, a4, 100, 1, 3, 2, 1).

ruta(x7, a7, 100, 1, 3, 2, 1).


ruta(x0, x1, 100, 1, 3, 2, 1).
ruta(x1, x2, 100, 1, 3, 2, 1).
ruta(x2, x3, 100, 1, 3, 2, 1).
ruta(x3, x4, 100, 1, 3, 2, 1).
ruta(x4, x5, 100, 1, 3, 2, 1).
ruta(x5, a7, 100, 1, 3, 2, 1).


ruta(y3, a3, 100, 1, 3, 2, 1).
ruta(y4, a4, 100, 1, 3, 2, 1).
ruta(y5, a5, 100, 1, 3, 2, 1).

ruta(y3, y4, 100, 1, 3, 2, 1).
ruta(y4, y5, 100, 1, 3, 2, 1).





ruta(a0, b0, 100, 1, 3, 2, 1).
ruta(b0, c0, 100, 1, 3, 2, 1).
ruta(c0, d0, 100, 1, 3, 2, 1).
ruta(d0, e0, 100, 1, 3, 2, 1).
ruta(e0, f0, 100, 1, 3, 2, 1).
ruta(f0, g0, 100, 1, 3, 2, 1).
ruta(g0, h0, 100, 1, 3, 2, 1).
ruta(h0, i0, 100, 1, 3, 2, 1).
ruta(i0, j0, 100, 1, 3, 2, 1).
ruta(b0, a0, 100, 1, 3, 2, 1).
ruta(c0, b0, 100, 1, 3, 2, 1).
ruta(d0, c0, 100, 1, 3, 2, 1).
ruta(e0, d0, 100, 1, 3, 2, 1).
ruta(f0, e0, 100, 1, 3, 2, 1).
ruta(g0, f0, 100, 1, 3, 2, 1).
ruta(h0, g0, 100, 1, 3, 2, 1).
ruta(i0, h0, 100, 1, 3, 2, 1).
ruta(j0, i0, 100, 1, 3, 2, 1).
ruta(b1, a1, 100, 1, 3, 2, 1).
ruta(c1, b1, 100, 1, 3, 2, 1).
ruta(d1, c1, 100, 1, 3, 2, 1).
ruta(e1, d1, 100, 1, 3, 2, 1).
ruta(f1, e1, 100, 1, 3, 2, 1).
ruta(g1, f1, 100, 1, 3, 2, 1).
ruta(h1, g1, 100, 1, 3, 2, 1).
ruta(i1, h1, 100, 1, 3, 2, 1).
ruta(j1, i1, 100, 1, 3, 2, 1).
ruta(a2, b2, 100, 1, 3, 2, 1).
ruta(b2, c2, 100, 1, 3, 2, 1).
ruta(c2, d2, 100, 1, 3, 2, 1).
ruta(d2, e2, 100, 1, 3, 2, 1).
ruta(e2, f2, 100, 1, 3, 2, 1).
ruta(f2, g2, 100, 1, 3, 2, 1).
ruta(g2, h2, 100, 1, 3, 2, 1).
ruta(h2, i2, 100, 1, 3, 2, 1).
ruta(i2, j2, 100, 1, 3, 2, 1).
ruta(b3, a3, 100, 1, 3, 2, 1).
ruta(c3, b3, 100, 1, 3, 2, 1).
ruta(d3, c3, 100, 1, 3, 2, 1).
ruta(e3, d3, 100, 1, 3, 2, 1).
ruta(f3, e3, 100, 1, 3, 2, 1).
ruta(g3, f3, 100, 1, 3, 2, 1).
ruta(h3, g3, 100, 1, 3, 2, 1).
ruta(i3, h3, 100, 1, 3, 2, 1).
ruta(j3, i3, 100, 1, 3, 2, 1).
ruta(a4, b4, 100, 1, 3, 2, 1).
ruta(b4, c4, 100, 1, 3, 2, 1).
ruta(c4, d4, 100, 1, 3, 2, 1).
ruta(d4, e4, 100, 1, 3, 2, 1).
ruta(e4, f4, 100, 1, 3, 2, 1).
ruta(f4, g4, 100, 1, 3, 2, 1).
ruta(g4, h4, 100, 1, 3, 2, 1).
ruta(h4, i4, 100, 1, 3, 2, 1).
ruta(i4, j4, 100, 1, 3, 2, 1).

ruta(b5, a5, 100, 1, 3, 2, 1).
ruta(c5, b5, 100, 1, 3, 2, 1).
ruta(d5, c5, 100, 1, 3, 2, 1).
ruta(e5, d5, 100, 1, 3, 2, 1).
ruta(f5, e5, 100, 1, 3, 2, 1).
ruta(g5, f5, 100, 1, 3, 2, 1).
ruta(h5, g5, 100, 1, 3, 2, 1).
ruta(i5, h5, 100, 1, 3, 2, 1).
ruta(j5, i5, 100, 1, 3, 2, 1).
ruta(a6, b6, 100, 1, 3, 2, 1).
ruta(b6, c6, 100, 1, 3, 2, 1).
ruta(c6, d6, 100, 1, 3, 2, 1).
ruta(d6, e6, 100, 1, 3, 2, 1).
ruta(e6, f6, 100, 1, 3, 2, 1).
ruta(f6, g6, 100, 1, 3, 2, 1).
ruta(g6, h6, 100, 1, 3, 2, 1).
ruta(h6, i6, 100, 1, 3, 2, 1).
ruta(i6, j6, 100, 1, 3, 2, 1).
ruta(b7, a7, 100, 1, 3, 2, 1).
ruta(c7, b7, 100, 1, 3, 2, 1).
ruta(d7, c7, 100, 1, 3, 2, 1).
ruta(e7, d7, 100, 1, 3, 2, 1).
ruta(f7, e7, 100, 1, 3, 2, 1).
ruta(g7, f7, 100, 1, 3, 2, 1).
ruta(h7, g7, 100, 1, 3, 2, 1).
ruta(i7, h7, 100, 1, 3, 2, 1).
ruta(j7, i7, 100, 1, 3, 2, 1).
ruta(a8, b8, 100, 1, 3, 2, 1).
ruta(b8, c8, 100, 1, 3, 2, 1).
ruta(c8, d8, 100, 1, 3, 2, 1).
ruta(d8, e8, 100, 1, 3, 2, 1).
ruta(e8, f8, 100, 1, 3, 2, 1).
ruta(f8, g8, 100, 1, 3, 2, 1).
ruta(g8, h8, 100, 1, 3, 2, 1).
ruta(h8, i8, 100, 1, 3, 2, 1).
ruta(i8, j8, 100, 1, 3, 2, 1).
ruta(a0, a1, 100, 1, 3, 2, 1).
ruta(a1, a2, 100, 1, 3, 2, 1).
ruta(a2, a3, 100, 1, 3, 2, 1).
ruta(a3, a4, 100, 1, 3, 2, 1).
ruta(a4, a5, 100, 1, 3, 2, 1).
ruta(a5, a6, 100, 1, 3, 2, 1).
ruta(a6, a7, 100, 1, 3, 2, 1).
ruta(a7, a8, 100, 1, 3, 2, 1).
ruta(a1, a0, 100, 1, 3, 2, 1).
ruta(a2, a1, 100, 1, 3, 2, 1).
ruta(a3, a2, 100, 1, 3, 2, 1).
ruta(a4, a3, 100, 1, 3, 2, 1).
ruta(a5, a4, 100, 1, 3, 2, 1).
ruta(a6, a5, 100, 1, 3, 2, 1).
ruta(a7, a6, 100, 1, 3, 2, 1).
ruta(a8, a7, 100, 1, 3, 2, 1).
ruta(b0, b1, 100, 1, 3, 2, 1).
ruta(b1, b2, 100, 1, 3, 2, 1).
ruta(b2, b3, 100, 1, 3, 2, 1).
ruta(b3, b4, 100, 1, 3, 2, 1).
ruta(b4, b5, 100, 1, 3, 2, 1).
ruta(b5, b6, 100, 1, 3, 2, 1).
ruta(b6, b7, 100, 1, 3, 2, 1).
ruta(b7, b8, 100, 1, 3, 2, 1).
ruta(c1, c0, 100, 1, 3, 2, 1).
ruta(c2, c1, 100, 1, 3, 2, 1).
ruta(c3, c2, 100, 1, 3, 2, 1).
ruta(c4, c3, 100, 1, 3, 2, 1).
ruta(c5, c4, 100, 1, 3, 2, 1).
ruta(c6, c5, 100, 1, 3, 2, 1).
ruta(c7, c6, 100, 1, 3, 2, 1).
ruta(c8, c7, 100, 1, 3, 2, 1).
ruta(d0, d1, 100, 1, 3, 2, 1).
ruta(d1, d2, 100, 1, 3, 2, 1).
ruta(d2, d3, 100, 1, 3, 2, 1).
ruta(d3, d4, 100, 1, 3, 2, 1).
ruta(d4, d5, 100, 1, 3, 2, 1).
ruta(d5, d6, 100, 1, 3, 2, 1).
ruta(d6, d7, 100, 1, 3, 2, 1).
ruta(d7, d8, 100, 1, 3, 2, 1).
ruta(e1, e0, 100, 1, 3, 2, 1).
ruta(e2, e1, 100, 1, 3, 2, 1).
ruta(e3, e2, 100, 1, 3, 2, 1).
ruta(e4, e3, 100, 1, 3, 2, 1).
ruta(e5, e4, 100, 1, 3, 2, 1).
ruta(e6, e5, 100, 1, 3, 2, 1).
ruta(e7, e6, 100, 1, 3, 2, 1).
ruta(e8, e7, 100, 1, 3, 2, 1).
ruta(f0, f1, 100, 1, 3, 2, 1).
ruta(f1, f2, 100, 1, 3, 2, 1).
ruta(f2, f3, 100, 1, 3, 2, 1).
ruta(f3, f4, 100, 1, 3, 2, 1).
ruta(f4, f5, 100, 1, 3, 2, 1).
ruta(f5, f6, 100, 1, 3, 2, 1).
ruta(f6, f7, 100, 1, 3, 2, 1).
ruta(f7, f8, 100, 1, 3, 2, 1).
ruta(g1, g0, 100, 1, 3, 2, 1).
ruta(g2, g1, 100, 1, 3, 2, 1).
ruta(g3, g2, 100, 1, 3, 2, 1).
ruta(g4, g3, 100, 1, 3, 2, 1).
ruta(g5, g4, 100, 1, 3, 2, 1).
ruta(g6, g5, 100, 1, 3, 2, 1).
ruta(g7, g6, 100, 1, 3, 2, 1).
ruta(g8, g7, 100, 1, 3, 2, 1).
ruta(h0, h1, 100, 1, 3, 2, 1).
ruta(h1, h2, 100, 1, 3, 2, 1).
ruta(h2, h3, 100, 1, 3, 2, 1).
ruta(h3, h4, 100, 1, 3, 2, 1).
ruta(h4, h5, 100, 1, 3, 2, 1).
ruta(h5, h6, 100, 1, 3, 2, 1).
ruta(h6, h7, 100, 1, 3, 2, 1).
ruta(h7, h8, 100, 1, 3, 2, 1).
ruta(i1, i0, 100, 1, 3, 2, 1).
ruta(i2, i1, 100, 1, 3, 2, 1).
ruta(i3, i2, 100, 1, 3, 2, 1).
ruta(i4, i3, 100, 1, 3, 2, 1).
ruta(i5, i4, 100, 1, 3, 2, 1).
ruta(i6, i5, 100, 1, 3, 2, 1).
ruta(i7, i6, 100, 1, 3, 2, 1).
ruta(i8, i7, 100, 1, 3, 2, 1).
ruta(j0, j1, 100, 1, 3, 2, 1).
ruta(j1, j2, 100, 1, 3, 2, 1).
ruta(j2, j3, 100, 1, 3, 2, 1).
ruta(j3, j4, 100, 1, 3, 2, 1).
ruta(j4, j5, 100, 1, 3, 2, 1).
ruta(j5, j6, 100, 1, 3, 2, 1).
ruta(j6, j7, 100, 1, 3, 2, 1).
ruta(j7, j8, 100, 1, 3, 2, 1).
ruta(j1, j0, 100, 1, 3, 2, 1).
ruta(j2, j1, 100, 1, 3, 2, 1).
ruta(j3, j2, 100, 1, 3, 2, 1).
ruta(j4, j3, 100, 1, 3, 2, 1).
ruta(j5, j4, 100, 1, 3, 2, 1).
ruta(j6, j5, 100, 1, 3, 2, 1).
ruta(j7, j6, 100, 1, 3, 2, 1).
ruta(j8, j7, 100, 1, 3, 2, 1).

% Semaforos

semaforo(a0).
semaforo(c0).
semaforo(d0).
semaforo(e0).
semaforo(f0).
semaforo(g0).
semaforo(h0).
semaforo(i0).
semaforo(j0).
semaforo(c1).
semaforo(e2).
semaforo(e3).
semaforo(e4).
semaforo(e5).
semaforo(e6).
semaforo(e7).
semaforo(d7).
semaforo(d4).
semaforo(f4).
semaforo(j4).
semaforo(j8).