% Sa se scrie un predicat care transforma o lista intr-o multime, in
% ordinea primei aparitii. Exemplu: [1,2,3,1,2] e transformat in [1,2,3].
%
% elimina(L:list, E:Integer, Rez:list) (i,i,o) - determinist
elimina([], _, []):-!.
elimina([H|T], E, [H|Rez]):-
    H =\= E, !,
    elimina(T, E, Rez).
elimina([_|T], E, Rez):-
    elimina(T, E, Rez).

% parcurge(L:list, Rez:list) (i, o) - determinist
parcurge([], []):-!.
parcurge([H|T], [H|Rez]):-
    elimina(T, H, Result),
    parcurge(Result, Rez).

