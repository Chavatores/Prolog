hombre(juan).
hombre(david).
hombre(erick).
hombre(manrique).

mujer(maria).
mujer(ivonne).
mujer(paulina).
mujer(bertha).
mujer(selene).

joven(paulina).
joven(bertha).
joven(maria).

joven(erick).
joven(juan).

mayor(selene).
mayor(ivonne).

mayor(david).
mayor(manrique).

gusta(maria,juan).
gusta(ivonne,david).
gusta(erick,maria).
gusta(erick,paulina).
gusta(erick,bertha).
gusta(paulina,erick).
gusta(david,ivonne).
gusta(bertha,erick).
gusta(selene,juan).
gusta(selene,erick).
gusta(manrique,maria).
gusta(manrique,ivonne).
gusta(manrique,paulina).
gusta(manrique,bertha).
gusta(manrique,selene).
gusta(juan,ivonne).
gusta(juan,selene).

pareja(Persona,Gusta1):-gusta(Persona,Gusta1),gusta(Gusta1,Persona).















