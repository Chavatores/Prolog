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

robot(X,Y,N,S):- not(Y,Yn), not(N,Nn),
	          and(X,Yn,S1), and(S1,Nn,S).



