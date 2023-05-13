%hermanos
papa('Salvador','Elizabeth').% Mi hermana Elizabeth
papa('Salvador','Chava'). % Salvador es mi papa

papa('Anacleto','TJose').% Tio
papa('TJose','Rosa Martha').

papa('Anacleto','TRuben').% Tio
papa('TRuben','Bibiana').
papa('TRuben','Claudia').
papa('TRuben','Isabel').
papa('TRuben','Jaime').
papa('TRuben','Rosa').
papa('TRuben','Carlos').
papa('TRuben','Oscar').
papa('TRuben','Diana').
papa('TRuben','J Antonio').

papa('Anacleto','TAsencion').% Tio
papa('TAsencion','Adela').
papa('TAsencion','Chayo').
papa('TAsencion','Lula').
papa('TAsencion','Chela').

papa('Anacleto','TRicardo').% Tio

papa('Anacleto','Salvador').
%----------------------------------------------------
papa('Juan','Anacleto').
papa('Ramiro','Juan').
papa('Cruz','Maria').
papa('Vicente','Cruz').
papa('Alberto','Carmen').
papa('Zenaido','Rosario').
papa('Jesus','Alicia').
papa('Pancho','Jesus').
papa('Alejo','Pancho').
papa('Antonio','Victoria').
papa('Jose','Piedad').
papa('Agustin','Jose').
papa('Fidencio','Martha').
%-------------------------------------------------------
mama('TClemensia','Rosa Martha').% Tia esposa de TJose

mama('TCarmen','Bibiana').% Tia esposa de TRuben
mama('TCarmen','Claudia').
mama('TCarmen','Isabel').
mama('TCarmen','Jaime').
mama('TCarmen','Rosa').
mama('TCarmen','Carlos').
mama('Tcarmen','Oscar').
mama('TCarmen','Diana').
mama('TCarmen','J Antonio').

mama('TMaria','Adela').% Tia esposa de TAsencion
mama('TMaria','Chayo').
mama('TMaria','Lula').
mama('TMaria','Chela').

%-------------------------------------------------------
mama('Alicia','Chava').
mama('Alicia','Elizabeth').
mama('Piedad','Alicia').
mama('Martha','Piedad').
mama('Mercedez','Martha').
mama('Guadalupe','Jose').
mama('Victoria','Jesus').
mama('Margarita','Victoria').
mama('Consuelo','Pancho').
mama('Maria','Salvador').
mama('Carmen','Maria').
mama('Evangelina','Carmen').
mama('Amelia','Cruz').
mama('Rosario','Anacleto').
mama('Juana','Rosario').
mama('Refugio','Juan').
%-----------------------------------------------------------
mujer('Elizabeth').
mujer('Alicia').
mujer('Piedad').
mujer('Martha').
mujer('Mercedez').
mujer('Guadalupe').
mujer('Victoria').
mujer('Margarita').
mujer('Consuelo').
mujer('Maria').
mujer('Carmen').
mujer('Evangelina').
mujer('Amelia').
mujer('Rosario').
mujer('Juana').
mujer('Refugio').
mujer('Rosa Martha').
mujer('Bibiana').
mujer('Claudia').
mujer('Isabel').
mujer('Rosa').
mujer('Diana').
mujer('Adela').
mujer('Chayo').
mujer('Lula').
mujer('Chela').
mujer('TCarmen').
mujer('TMaria').
mujer('TClemensia').
%----------------------------------------------------------
hombre('Chava').
hombre('Salvador').
hombre('Anacleto').
hombre('Juan').
hombre('Ramiro').
hombre('Cruz').
hombre('Vicente').
hombre('Alberto').
hombre('Zenaido').
hombre('Jesus').
hombre('Pancho').
hombre('Alejo').
hombre('Antonio').
hombre('Jose').
hombre('Agustin').
hombre('Fidencio').
hombre('TJose').
hombre('TRuben').
hombre('TAsencion').
hombre('TRicardo').
hombre('Jaime').
hombre('Carlos').
hombre('Oscar').
hombre('J Antonio').

% H es hijo de P si P es padre de H y X es hombre o mujer
hijo(H,P) :- hombre(X), papa(P,H),papa(P,X).
hija(H,P) :- mujer(Y), papa(P,H),papa(P,Y).

% A es abuelo de N si A es padre de P y P es padre N

abuelo(A,N) :- papa(A,P), papa(P,N).
abuelo(A,N) :- papa(A,M), mama(M,N).
abuela(A,N) :- mama(A,M), mama(M,N).
abuela(A,N) :- mama(A,P), papa(P,N).
% BO es Bisabuelo de N si BO es padre de A y A es padre de P y P es
% padre de N
bisabuelo(BO,N) :- papa(BO,A), abuelo(A,N), hombre(BO).
bisabuelo(BO,N) :- papa(BO,A), abuela(A,N), hombre(BO). 
bisabuela(BA,N) :- mama(BA,A), abuelo(A,N), mujer(BA).
bisabuela(BA,N) :- mama(BA,A), abuela(A,N), mujer(BA).
% TA es Tatarabuelo de N si Ta es padre de BA y BA es 
tatarabuelo(TA,N) :- papa(TA,BO), papa(BO,A), papa(A,P), papa(P,N).
tatarabuelo(TA,N) :- papa(TA,BO), papa(BO,A), papa(A,M), mama(M,N).
tatarabuelo(TA,N) :- papa(TA,BO), papa(BO,A), mama(A,M), mama(M,N).
tatarabuelo(TA,N) :- papa(TA,BA), mama(BA,A), mama(A,M), mama(M,N).
tatarabuela(TA,N) :- mama(TA,BA), mama(BA,A), mama(A,M), mama(M,N).
tatarabuela(TA,N) :- mama(TA,BA), mama(BA,A), mama(A,P), papa(P,N).
tatarabuela(TA,N) :- mama(TA,BA), mama(BA,A), papa(A,P), papa(P,N).
tatarabuela(TA,N) :- mama(TA,BO), papa(BO,A), papa(A,P), papa(P,N).

% H1 y H2 son hermanos si el padre de H1 es también el padre de H2 y 
% si H1 y H2 no son lo mismo

hermano(H1,H2) :- papa(P,H1) , papa(P,H2), hombre(H1), papa(P,H1), H1 \== H2.
hermana(H1,H2) :- papa(P,H1) , papa(P,H2), mujer(H1), papa(P,H1), H1 \== H2.

% N es nieto de A  es padre de P y P es padre de N
% Nietos
nieto(N,A) :- abuelo(A,N), hombre(N).
nieto(N,A) :- abuela(A,N), hombre(N).
%Nietas
nieta(N,A) :- abuelo(A,N), mujer(N).
nieta(N,A) :- abuela(A,N), mujer(N).
%Tios
tio(Tio,Sobrino) :- hermano(Papa,Tio), papa(Papa,Sobrino).
tia(Tia,Sobrino) :- hermana(Mama,Tia), mama(Mama,Sobrino).
%Primos
primo(Alguien,Primo) :- tia(Tia,Alguien), mama(Tia,Primo), hombre(Primo).
primo(Alguien,Primo) :- tio(Tio,Alguien), papa(Tio,Primo), hombre(Primo).
prima(Alguien,Primo) :- tio(Tio,Alguien), papa(Tio,Primo), mujer(Primo).
prima(Alguien,Primo) :- tia(Tia,Alguien), mama(Tia,Primo), mujer(Primo).
%Esposo
esposo(Papa,Mama):- papa(Papa,Hijo), mama(Mama,Hijo).
esposa(Mama,Papa):- papa(Papa,Hijo), mama(Mama,Hijo).
%Tio politico
tiaP(Tio,Alguien):- esposo(Tio,Tia), tia(Tia,Alguien).
tioP(Tia,Alguien):- esposa(Tia,Tio), tio(Tio,Alguien).
%Tios politicos
tiosP(TiosP,Alguien) :- tiaP(TiosP,Alguien),
			tioP(TiosP,Alguien).






