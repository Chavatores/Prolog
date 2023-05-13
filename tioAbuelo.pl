padre(a,a1).
padre(a,a2).
padre(a1,a11).
padre(a1,a12).
padre(a2,a21).
padre(a11,a111).
padre(a12,a121).
casados(a,b).
casados(a1,b1).
casados(a2,b2).


tio(TioAbuelo,SobrinoN) :- padre(Padre,Abuelo), padre(Padre,TioAbuelo), 
			   padre(Abuelo,Papa), padre(Papa,SobrinoN), 
			   Abuelo \== TioAbuelo.
