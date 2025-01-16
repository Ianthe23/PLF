% Sa se scrie un program Prolog care genereaza lista aranjamentelor de k
% elemente dintr-o lista de nr intregi, avand produs P dat.

sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-!,
    sterge(T, E, Rez).
sterge([E|T], E, T):-!.



% candidat(L:list, E:Integer)
% model de flux: (i,o)
candidat([E|_], E).
candidat([_|T], E):-
    candidat(T, E).

% aranjamente(L:list, K:Integer, P:Integer, C:list)
% model de flux: (i,i,i,o)
aranjamente(L, K, P, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    aranjamente_aux(Rez, K, P, C, E, 1, [E]).

% aranjamente_aux(L:list, K:Integer, P:Integer, C:list, Prod:Integer,
% Lg:Integer, Col:list)
% model de flux:(i,i,i,o,i,i,i)
aranjamente_aux(_, K, P, Col, P, K, Col):-!.
aranjamente_aux(L, K, P, C, Prod, Lg, [H|Col]):-
    candidat(L, E),
    sterge(L, E, Rez),
    Prod1 is Prod * E,
    Prod1 =< P,
    Lg1 is Lg + 1,
    Lg1 =< K,
    aranjamente_aux(Rez, K, P, C, Prod1, Lg1, [E|[H|Col]]).


f([], 0).
f([H|T], S):-f(T, S1), S1 is S-H.
