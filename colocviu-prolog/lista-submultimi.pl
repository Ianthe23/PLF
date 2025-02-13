sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-
    H \= E, !,
    sterge(T, E, Rez).
sterge([E|T], E, T).

candidat([H|_], H).
candidat([_|T], E):-
    candidat(T, E).

submultimi(L, N, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    submultimi_aux(Rez, N, C, 1, E, [E]).

submultimi_aux(_, N, Col, N, Sum, Col):-
    Rest is Sum mod 2,
    Rest =:= 0, !.
submultimi_aux(L, N, C, Lg, Sum,[H|Col]):-
    candidat(L, E),
    Lg1 is Lg + 1,
    Lg1 =< N,
    H > E,
    sterge(L, E, Rez),
    Sum1 is Sum + E,
    submultimi_aux(Rez, N, C, Lg1, Sum1, [E|[H|Col]]).

