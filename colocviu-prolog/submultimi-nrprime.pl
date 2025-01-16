nr_prim(N, _):-
    N = 2, !.
nr_prim(N, Div):-
    Div > N // 2, !.
nr_prim(N, Div):-
    Rest is N mod Div,
    Rest > 0,
    Div1 is Div + 1,
    nr_prim(N, Div1).


candidat(N, _, N):-
    nr_prim(N, 2).
candidat(N, Max, Rez):-
    N < Max,
    N1 is N + 1,
    candidat(N1, Max, Rez).

candidat_lista([E|_], E).
candidat_lista([_|T], E):-
    candidat_lista(T, E).

% model flux(i,o)
submultime(N, C):-
    candidat(2, N, E),
    submultime_aux(N, C, E, [E]).

submultime_main(N, C):-
    findall(Rez, submultime(N, Rez), C).


%submultime_aux(N, C-OUTPUT, Suma, Col)
%model de flux (i,o,i,i)
submultime_aux(N, Col, N, Col):-!.
submultime_aux(N, C, Sum, [H|Col]):-
    candidat(2, N, E),
    Sum1 is Sum + E,
    Sum1 =< N,
    H > E,
    submultime_aux(N, C, Sum1, [E|[H|Col]]).



