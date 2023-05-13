:- dynamic aprender/2.
:- dynamic borrar/2.

enemigo(sapo,serpiente).
enemigo(ciervo,lobo).
enemigo(gato,perro).
encontrar_enemigo:- read(X),enemigo(X,Y),write(Y).
aprender:- read(X), read(Y),
	   assertz(enemigo(X,Y)).
borrar:-read(X), read(Y),
        retract(enemigo(X,Y)).
