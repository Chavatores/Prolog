:- dynamic capital_of/2.

capital_of(suiza, berna).
capital_of(chile, santiago).
capital_of(eeuu, washington).
capital_of(estados_unidos, washington).
capital_of(italia, roma).
capital_of(francia, paris).
capital_of(austria, viena).
capital_of(alemania, berlin).
capital_of(españa, madrid).
capital_of(peru, lima).
capital_of(mexico, cuidad_de_mexico).

nuevo:- read(X), read(Y), assertz(capital_of(X,Y)).
quitar:- read(X), read(Y), retract(capital_of(X,Y)).

borrar:- read(Pais), retract(capital_of(Pais,_)).
