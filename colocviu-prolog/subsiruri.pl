sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-
    H \= E, !,
    sterge(T, E, Rez).
sterge([E|T], E, T).

candidat([E|_], E).
candidat([_|T], E):-
    candidat(T, E).

lista(L, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    lista_aux(Rez, C, 1, [E]).

submultimi(L, Rezultat):-
    findall(Submultimi, lista(L, Submultimi), Rezultat).

lista_aux(_, Col, Lg, Col):-
    Lg >= 2.
lista_aux(L, C, Lg, [H|Col]):-
    candidat(L, E),
    Lg1 is Lg + 1,
    H > E,
    sterge(L, E, Rez),
    lista_aux(Rez, C, Lg1, [E|[H|Col]]).


