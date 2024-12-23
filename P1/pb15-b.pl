% Sa se elimine prima aparitie a elementului minim dintr-o lista de numere
% intregi.
%
% minim(L:list, Minim:Integer, MinimFinal:Integer) (i,i,o) - determinist
minim([], Minim, Minim):-!.
minim([H|T], Minim, MinimFinal):-
    H < Minim, !,
    minim(T, H, MinimFinal).
minim([_|T], Minim, MinimFinal):-
    minim(T, Minim, MinimFinal).

% prelucrare(L:list, Minim:Integer, Ok:Integer, Rez:list) (i,i,i,o)
% determinist
prelucrare([], _, _, []):-!.
prelucrare([H|T], Minim, 0, Rez):-
    H =:= Minim, !,
    prelucrare(T, Minim, 1, Rez).
prelucrare([H|T], Minim, Ok, [H|Rez]):-
    prelucrare(T, Minim, Ok, Rez).

% sterge_minim(L:list, Rez:list), (i,o) - determinist
sterge_minim(L, Rez):-
    C = L,
    minim(C, 10000, Minim),
    prelucrare(L, Minim, 0, Rez).