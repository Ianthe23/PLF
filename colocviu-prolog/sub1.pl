lungime([], Lg, Lg):-!.
lungime([_|T], Lg, Rez):-
    Lung1 is Lg + 1,
    lungime(T, Lung1, Rez).

sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-
    H \= E, !,
    sterge(T, E, Rez).
sterge([E|T], E, T).

candidat([E|_], E).
candidat([_|T], E):-
    candidat(T, E).

permutari(L, N, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    permutari_aux(Rez, N, C, 1, [E]).

permutari_main(L, C):-
    Copie = L,
    lungime(Copie, 0, Lg),
    findall(Rez, permutari(L, Lg, Rez), C).

permutari_aux(_, N, Col, N, Col):-!.
permutari_aux(L, N, C, Lg, [H|Col]):-
    candidat(L, E),
    Lg1 is Lg + 1,
    Lg1 =< N,
    Dif is E - H,
    Absolut is abs(Dif),
    Absolut =< 3,
    sterge(L, E, Rez),
    permutari_aux(Rez, N, C, Lg1, [E|[H|Col]]).


