papa(homero,abuelo).
papa(bart,homero).
papa(lisa,homero).
papa(maggy,homero).

abuelo(Nieto,Abue):-papa(Nieto,Papa),papa(Papa,Abue).
hermano(Hermano,Hermano2):-papa(Hermano,P),papa(Hermano2,P).

