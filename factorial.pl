factorial(0,1):- !.
factorial(N,Nf):- R is N-1,
	          factorial(R,Rf),
		  Nf is N*Rf.
