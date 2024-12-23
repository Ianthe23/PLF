% Se da o lista de numere intregi. Se cere sa se adauge in lista dupa 1-ul
% element, al 3-lea element, al 7-lea elemen, al 15-lea element � o
% valoare data e.
%
% prelucrare(L:list, E:Integer, IndexIns:Integer, Index:Integer,
% Rez:List) (i,i,i,i,o) - det.
prelucrare([], _, _, _,[]):-!.
prelucrare([H|T], E, IndexIns, Index, [H,E|Rez]):-
    Dif is IndexIns - 1,
    Index == Dif, !,
    NouIndexIns is IndexIns * 2,
    NouIndex is Index + 1,
    prelucrare(T, E, NouIndexIns, NouIndex, Rez).
prelucrare([H|T], E, IndexIns, Index, [H|Rez]):-
    NouIndex is Index + 1,
    prelucrare(T, E, IndexIns, NouIndex, Rez).

main11(L, E, Rez):-
    prelucrare(L, E, 2, 1, Rez).
