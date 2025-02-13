sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-
    H \= E, !,
    sterge(T, E, Rez).
sterge([E|T], E, T).

candidat([E|_], E).
candidat([_|T], E):-
    candidat(T, E).

subset(L, N, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    subset_aux(Rez, N, C, 1, E, [E]).

subset_main(L, N, C):-
    findall(Rez, subset(L, N, Rez), C).

subset_aux(_, N, Col, Lg, Sum, Col):-
    Rest is Sum mod 3,
    Rest =:= 0,
    Lg >= N.
subset_aux(L, N, C, Lg, Sum, [H|Col]):-
    candidat(L, E),
    Lg1 is Lg + 1,
    Sum1 is Sum + E,
    H > E,
    sterge(L, E, Rez),
    subset_aux(Rez, N, C, Lg1, Sum1, [E|[H|Col]]).


p(1).
p(2).
q(1).
q(2).
r(1).
r(2).

s:- p(X), !, q(Y), r(Z), write(X), write(Y), write(Z), nl.

f([], []).
f([H|T], [H|S]):-f(T, S).
f([H|T], S):-H mod 2 =:= 0, f(T,S).

h([], [_|L], L).
h([_|T], L, Rez):-!, h(T,L,Rez).
h([H|T], L, [H|Rez]):-h(T,L,Rez).

