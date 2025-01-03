% Sa se scrie un predicat care testeaza egalitatea a doua multimi, fara
% sa se faca apel la diferenta a doua multimi.
%
% verifica(L:list, E:Integer) (i,i) - determinist
verifica([], _) :- fail.
verifica([E|_], E):-!.
verifica([_|T], E):-
    verifica(T, E).

% egalitate(L1:list, L2:list), (i,i) - determinist
egalitate([], _):-!.
egalitate([H|T], L):-
    C = L,
    verifica(C, H), !,
    egalitate(T, L).

% multime(L1:list, L2:list) (i,i) - determinist
multime(L1, L2):-
    C1 = L1,
    C2 = L2,
    egalitate(C1, C2),
    C1 = L1,
    C2 = L2,
    egalitate(C2, C1).
