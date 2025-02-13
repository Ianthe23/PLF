sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-
    H \= E, !,
    sterge(T, E, Rez).
sterge([E|T], E, T).

candidat([E|_], E).
candidat([_|T], E):-
    candidat(T, E).

aranjamente(L, K, V, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    aranjamente_aux(Rez, K, V, C, 1, E, [E]).

aranjamente_aux(_, K, V, Col, K, Prod, Col):-
    Prod =< V, !.
aranjamente_aux(L, K, V, C, Lg, Prod, Col):-
    candidat(L, E),
    Lg1 is Lg + 1,
    Lg1 =< K,
    Prod1 is Prod * E,
    Prod1 < V,
    sterge(L, E, Rez),
    aranjamente_aux(Rez, K, V, C, Lg1, Prod1, [E|Col]).

aranjamente_main(L, K, V, C):-
    findall(Rez, aranjamente(L, K, V, Rez), C).

