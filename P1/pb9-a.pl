% Sa se scrie un predicat care intoarce intersectia a doua multimi.
%
% exista(L:list, E:Integer) (i,i) - determinist
exista([], _):-fail.
exista([E|_], E):-!.
exista([_|T], E):-
    exista(T, E).

% prelucreaza(L1:list, L2:list, C:list, Rez:list) (i,i,i,o) -
% determinist
prelucreaza([], _, []):-!.
prelucreaza([H|T], L, C, [H|Rez]):-
    exista(C, H), !,
    prelucreaza(T, L, L, Rez).
prelucreaza([_|T], L, C, Rez):-
    prelucreaza(T, L, C, Rez).
