:- dynamic animal/2.

jugar:-consult('bda.pl'),
       comienzo.

comienzo:- write('Seleciona una opción'),
           nl,
           nl,
           write('1. Adivinar un animal'),
           nl,
           nl,
           write('2. Eliminar un animal de la base de conocimientos'),
           nl,
           nl,
	   write('3. Guardar datos en la base de conocimientos'),
           nl,
           nl,
           write('Opción: '),
           read(O),
           adivinar_borrar_guardar(O).

adivinar_borrar_guardar(1):-nl,
	animal(C,A),
	write('El animal en el que piensas... '),
	write('¿'),
	write(C),
	write('? '),
	read(R),
	nl,
	(R == s)
	->
	write('El animal con esa característica es un(a) '),
	write(A),
	write('...'),
	nl,
	nl,
	continuar;
	%%guardar;
	adivine(R).

adivine(n):-write('No conozco el animal...'),
	    nl,
	    nl,
	    write('Escribe su caracteristica: '),
	    read(C),
	    nl,
	    write('Escribe el nombre del animal: '),
	    read(A),
	    nl,
	    assertz(animal(C,A)),
	    continuar.
	    %%guardar.

adivinar_borrar_guardar(2):-nl,
	    write('Dime el nombre del animal que deseas eliminar: '),
  	    read(A),
	    nl,
	    retract(animal(_,A)),
	    %%guardar,
 	    continuar.

adivinar_borrar_guardar(3):- nl,
	  write('¿Deseas guardar los cambios en la base de conocimientos? '),
	  nl,
	  read(R1),
	  (R1 == s)
	  ->
	  nl,
	  write('Grabando en la base de conocimientos...'), 
	  nl,
          tell('bda.pl'),
          listing(animal),
          told,
          write('Listo.'),
	  nl,
	  nl;
	  write('Cambios no almacenados'),
	  nl,
	  nl,
	  write('Gracias por jugar.').

continuar:- write('¿Quieres seguir jugando? '),
	    read(R),
	    (R == s)
	    ->
	    comienzo;
	    nl,
	    write('Gracias por jugar.').


















