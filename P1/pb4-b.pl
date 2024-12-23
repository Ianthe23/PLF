% Sa se elimine elementul de pe pozitia a n-a a unei liste liniare.
%
% eliminare(L:list, Poz:Integer, I:Integer, Rez:list) (i,i,i,o) -
% determinist
eliminare([], _, _, []):-!.
eliminare([_|T], Poz, I, Rez):-
    Poz =:= I, !,
    I1 is I + 1,
    eliminare(T, Poz, I1, Rez).
eliminare([H|T], Poz, I, [H|Rez]):-
    I1 is I + 1,
    eliminare(T, Poz, I1, Rez).
