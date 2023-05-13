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

circuito(X,Y,S):- or(X,Y,S1), 
	          and(X,Y,S2), not(S2,S2N), 
		  and(S1,S2N,S3),
		  and(S2,S3,S).
	          
	
		  

