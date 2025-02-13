% Pt o valoare N data sa se genereze permutarile cu elementele N, N+1,
% ..., 2*N - 1, avand proprietatea ca valoarea absoluta a diferentei a 2
% valori consecutive este <= 2.
%
% apare(L:List, E:Integer)
% model de flux(i,i)
apare([], _):-!.
apare([H|T], E):-
    H \= E, !,
    apare(T, E).


% candidat(N:Integer, Max:Integer, E:Integer)
% model de flux: (i,i,o)
candidat(N, _, N).
candidat(N, Max, E):-
    N \= Max,
    N1 is N + 1,
    candidat(N1, Max, E).

% permutari(N:Integer, C:List)
% model de flux: (i,o)
permutari(N, C):-
    Max is 2 * N - 1,
    candidat(N, Max, E),
    E =< Max,
    permutari_aux(N, C, 1, [E]).

% permutari_aux(N:Integer, C:List, Lg:Integer, Col:List)
% model de flux(i,o,i,i)
permutari_aux(N, Col, N, Col):-!.
permutari_aux(N, C, Lg, [H|Col]):-
    Max is 2 * N - 1,
    candidat(N, Max, E),
    E =< Max,
    apare([H|Col], E),
    Lg1 is Lg + 1,
    Lg1 =< N,
    Dif is H - E,
    Rez is abs(Dif),
    Rez =< 2,
    permutari_aux(N, C, Lg1, [E|[H|Col]]).


f([], []).
f([H|T], [H|S]):-f(T,S).
f([H|T], S):-H mod 2 =:= 0, f(T, S).

