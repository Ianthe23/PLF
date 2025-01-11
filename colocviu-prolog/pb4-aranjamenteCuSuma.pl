% Sa se scrie un program prolog care genereaza lista aranjamentelor de
% cate k elemente, avand suma S data.

% sterge(L:list, E:Integer, Rez:list)
% model de flux(i, i, o)
sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-
    H \= E, !,
    sterge(T, E, Rez).
sterge([E|T], E, T).

% candidat(L:list, E:Integer)
% model de flux(i,o)
candidat([E|_], E).
candidat([_|T], E):-
    candidat(T, E).

% aranjamente(L:list, K:Integer, S:Integer, C:List)
% model de flux: (i,i,i,o)
aranjamente(L, K, S, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    aranjamente_aux(Rez, K, S, C, 1, E, [E]).

% aranjamente_aux(L:list, K:Integer, S:Integer, C:list, Lg: Integer,
% Sum:Integer, Col:list)
% model de flux (i,i,i,o,i,i,i)
aranjamente_aux(_, K, S, Col, K, S, Col):-!.
aranjamente_aux(L, K, S, C, Lg, Sum, Col):-
    candidat(L, E),
    Sum1 is Sum + E,
    Sum1 =< S,
    Lg1 is Lg + 1,
    Lg =< K,
    sterge(L, E, Rez),
    aranjamente_aux(Rez, K, S, C, Lg1, Sum1, [E|Col]).

