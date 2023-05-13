xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).

and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

not(0,1).
not(1,0).



tinaco(T,A,Y,Z):- not(T,NT), and(NT,A,Z1), not(Z1,NZ1), xor(NZ1,Y,Z).
		       
			
		    


