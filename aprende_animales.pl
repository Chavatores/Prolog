:- dynamic animal/2,cumple/1.

adivina:- consult('bda.pl'),
	  nl,nl,
	  write('----------------------------------------------------------------'),nl,
	  write('BIENVENIDO AL JUEGO DONDE ADIVINAR� EL ANIMAL QUE ESTAS PENSANDO'),nl,	  
	  write('----------------------------------------------------------------'),nl,nl,
	  pregunta.

pregunta :- write('----------------------------------------------------------------'),nl,
	    write('                     �Piensa en un Animal!                      '),nl,
	    write('----------------------------------------------------------------'),nl,
	    animal(C,_), write('--> El Animal '), write(C), write('? s/n :: '), read(Respuesta), 
	    ((Respuesta == s) -> cumple(C);\+animal(C,_),pregunta);((\+animal(C,_)= false) -> no_cumple).

cumple(C):- animal(C,Y), 
	    write('::>> Entonces es un: '), write(Y), write(' ? s/n :: '),
	    read(Respuesta),
	    ((Respuesta == s) -> write('Te he ganado'),nl,preguntasalir; no_cumple).

no_cumple:- nl,write('>> No conozco el animal...<<'), nl,
	    write('Por favor, dime cual es la caracter�stica: '),nl,
            write('----------------------------------------------------------------'),nl,
	    read(C),
            write('----------------------------------------------------------------'),nl,
	    write('Por favor, dime cual es el animal: '),nl, 
            write('----------------------------------------------------------------'),nl,
	    read(Y),
            write('----------------------------------------------------------------'),nl,
	    write('Me haz ganado pero he aprendido'), 
 	    assertz(animal(C,Y)),
	    preguntasalir.

preguntasalir:- nl,write('----------------------------------------------------------------'),nl,
	       	write('Deseas seguir jugando? '),nl,
	        write('----------------------------------------------------------------'),nl,
	        read(Respuesta),
		((Respuesta == s) -> pregunta ; write('>>>>>> Fu� un gusto jugar contigo <<<<<<<'), guardar).

guardar :- nl,write('Grabando la base de conocimientos...'),
	   tell('bda.pl'),listing(animal),told,write('Listo.').











