% Sa se scrie un predicat care, primind o lista, intoarce multimea
% tuturor perechilor din lista. De ex, cu [a, b, c, d] va produce
% [[a, b], [a, c], [a, d], [b, c], [b, d], [c, d]].
%
% elimina_aparitii(L:list, E:Integer, Rez:list) (i,i,o) - determinist
elimina_aparitii([], _, []):-!.
elimina_aparitii([H|T], E, [H|Rez]):-
    H \= E, !,
    elimina_aparitii(T, E, Rez).
elimina_aparitii([_|T], E, Rez):-
    elimina_aparitii(T, E, Rez).

% multime(L:list, Rez:list) (i,o) - determinist
multime([], []):-!.
multime([H|T], [H|Rez]):-
    elimina_aparitii(T, H, Result),
    multime(Result, Rez).

% perechi(L:list, E:Integer, Rez:list) (i,i,o) - determinist
perechi([], _, []):-!.
perechi([H|T], E, [[E,H]|Rez]):-
    perechi(T, E, Rez).

% prelucrare(L:list, Rez:list) (i,o) - determinist
prelucrare([], []):-!.
prelucrare([H|T], [Result|Rez]):-
    perechi(T, H, Result),
    Result \= [], !,
    prelucrare(T, Rez).
prelucrare([_|T], Rez):-
    prelucrare(T, Rez).

% main(L:list, Rez:list) (i,o) - determinist
functie_principala(L, Rez):-
    multime(L, Lista),
    prelucrare(Lista, Rez).
