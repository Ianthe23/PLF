candidat(N, N).
candidat(N, E):-
    N > 1,
    N1 is N - 1,
    candidat(N1, E).

combinari(N, K, C):-
    candidat(N, E),
    combinari_aux(N, K, C, 1, [E]).

combinari_aux(_, K, Col, K, Col):-!.
combinari_aux(N, K, C, Lg, [H|Col]):-
    candidat(N, E),
    Lg1 is Lg + 1,
    Lg1 =< K,
    E < H,
    Dif is H - E,
    Absolut is abs(Dif),
    Rest is Absolut mod 2,
    Rest =:= 0,
    combinari_aux(N, K, C, Lg1, [E|[H|Col]]).
