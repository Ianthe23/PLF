% Definiti un predicat care selecteaza al n-lea element al unei liste.
%
% selectare(L:list, Index:Integer, N:Integer, Nr:Integer,
% Rezultat:Integer), (i,i,i,i,o) - determinist
selectare([], _, _, -1):-!.
selectare([_|T], Index, N, Rez):-
    N =\= Index, !,
    IndexUrmator is Index + 1,
    selectare(T, IndexUrmator, N, Rez).
selectare([H|_], _, _, H).
