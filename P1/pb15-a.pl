% Sa se scrie un predicat care se va satisface daca o lista are numar
% par de elemente si va esua in caz contrar, fara sa se numere
% elementele listei.
%
% nr_par(L:lista) (i) - determinist
nr_par([]):-!.
nr_par([_]):-fail.
nr_par([_,_|T]):-
    nr_par(T).
