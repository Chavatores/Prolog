or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

not(0,1).
not(1,0).

circuito(A,B,C,D,E,Z):- and(A,B,Z1),
			or(C,D,Z2),
			and(Z1,Z2,Z3),
			or(Z3,E,Z).


