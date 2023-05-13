/* ADIVINO EL ANIMAL EN EL QUE ESTAS PENSANDO
Para empezar el juego, teclea: " ?- start." */
/*Comienza el juego*/
/*Para implementar el juego partiremos de un árbol en el que tendremos
todos los animales que podemos adivinar y las relaciones entre ellos*/
/*Hace dinámicas las funciones que se van a añadir con assert*/
:- dynamic cumple/1,no_cumple/1,sera/1,verificar/1.
start :-
nl,
write('PARA ADIVINAR EL ANIMAL EN EL QUE ESTAS PENSANDO, '),
nl,
write('RESPONDE A LAS SIGUIENTES PREGUNTAS'),
nl,
nl,
sera(Animal),
/*En primer lugar llamamos a la función hipótesis.
Con esta función empezaremos en el nodo raíz e iremos avanzando
en el árbol */
/*Cuando lleguemos a una hoja del árbol, habremos encontrado la
respuesta*/
nl,
nl,
write('****************************************'),
nl,
write('Creo que el animal es '),
write(Animal),
nl,
write('****************************************'),
nl,
nl,
/*Aprendizaje de nuestro programa*/
/*Comprobamos si hemos acertado el animal*/
write('¿He acertado? (s/n) '),
read(Respuesta),
nl,
/*En el caso de no haber acertado, intentamos introducir una
regla para su aprendizaje*/
( (Respuesta == s)
->
borrar,
seguir_jugando ;
write('¿Qué animal es? '),
read(Respuesta1),
nl,
write('Dime una pregunta para '),
write(Respuesta1),
write(' que lo diferencie de '),
write(Animal),
write(': '),
read(Respuesta2),
nl,
nl,
asserta( (sera(Respuesta1) :- Animal, verificar(Respuesta2)) ) ,
borrar,
seguir_jugando).
/* Hipótesis de animales que se van a comprobar */
sera(rana) :- rana, !.
sera(salamandra) :- salamandra, !.
sera(serpiente) :- serpiente, !.
sera(tortuga) :- tortuga, !.
sera(cocodrilo) :- cocodrilo, !.
sera(jirafa) :- jirafa, !.
sera(conejo) :- conejo, !.
sera(hombre) :- hombre, !.
sera(oso) :- oso, !.
sera(tigre) :- tigre, !.
sera(leon) :- leon, !.
sera(aguila) :- aguila, !.
sera(pato) :- pato, !.
sera(gallina) :- gallina, !.
sera(avestruz) :- avestruz, !.
sera(pinguino) :- pinguino, !.
sera(carpa) :- carpa, !.
sera(pez_espada):- pez_espada.
/* Reglas con las que identificaremos los distintos animales */
/*Anfibios*/
rana :- sangre_fria,
anfibio,
verificar(salta).
salamandra :- sangre_fria,
anfibio.
/*Reptiles*/
serpiente :- sangre_fria,
verificar(se_arrastra).
tortuga :- sangre_fria,
verificar(tiene_caparazon).
cocodrilo :- sangre_fria.
/*Mamíferos*/
jirafa :- mamifero,
herbivoro,
verificar(tiene_cuello_largo).
conejo :- mamifero,
herbivoro.
hombre :- mamifero,
omnivoro,
verificar(razona).
oso :- mamifero,
omnivoro.
tigre :- mamifero,
verificar(tiene_rayas).
leon :- mamifero.
/*Aves*/
aguila :- ave,
voladora,
verificar(es_ave_rapaz).
pato :- ave,
voladora.
gallina :- ave,
verificar(es_domestico).
avestruz :- ave,
verificar(corre_veloz).
pinguino :- ave.
/*Peces*/
carpa :- verificar(vive_rio).
pez_espada.
/* Reglas con las que clasificaremos los animales en: anfibios,
reptiles, mamíferos, aves y peces */
/* Para ello utilizaremos la función verificar */
sangre_fria :- verificar(tiene_sangre_fria).
anfibio :- verificar(vive_tierra_y_agua).
mamifero :- verificar(tiene_pelo).
herbivoro :- verificar(es_herbivoro).
omnivoro :- verificar(es_omnivoro).
ave :- verificar(tiene_alas).
voladora :- verificar(vuela).
/* Función verificar, desde aquí llamaremos a la función que
preguntara por cada característica */
verificar(S) :-
(cumple(S)
->
true ;
(no_cumple(S)
->
fail ;
preguntar(S))).
/* Para avanzar por el árbol, se irán realizando preguntas con las
distintas características. Esto lo haremos con la función preguntar*/
preguntar(Pregunta) :-
write('¿Tiene el animal la siguiente característica: '),
write(Pregunta),
write('? (s/n) '),
read(Respuesta),
nl,
/*Avanzamos en función de la respuesta a la característica, hacia
una rama u otra del árbol */
/*Con assert, guardamos el camino seguido */
( (Respuesta == s) -> assert(cumple(Pregunta)) ;
assert(no_cumple(Pregunta)), fail).
seguir_jugando :-
/*Ofrecemos la oportunidad de volver a jugar otra vez*/
write('¿Quieres seguir jugando? '),
read(Respuesta3),
( (Respuesta3 == s)
->
start ;
nl,
nl,
write('ESPERO QUE HAYAS DISFRUTADO JUGANDO CONMIGO'),
nl,
nl,
write('ADIOS'),
nl).
/* Borramos todos los valores almacenados con assert que indican el
camino seguido en el árbol */
borrar :- retract(cumple(_)),fail.
borrar :- retract(no_cumple(_)),fail.
borrar.
