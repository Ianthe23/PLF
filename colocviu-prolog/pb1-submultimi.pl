% Sa se scrie un program Prolog care genereaza lista submultimilor de
% suma data S, cu elementele unei liste

sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-
    sterge(T, E, Rez).
sterge([E|T], E, T):-!.



% candidat(L:list, I:Integer)
% model de flux (i,o)
candidat([E|_], E).
candidat([_|T], E):-
    candidat(T, E).

% submultime(L:list, S:Integer, C:list)
% model de flux (i,i,o)
submultime(L, S, C):-
    candidat(L, I),
    sterge(L, I, Rez),
    submultime_aux(Rez, S, C, I, [I]).

% submultime_aux(L:list, S:Integer, C: List, Sum:Integer, Col:list)
% model de flux (i,i,o,i,i)
submultime_aux(_, S, Col, S, Col):-!.
submultime_aux(L, S, C, Sum, [H|Col]):-
    candidat(L, E),
    H >= E,
    sterge(L, E, Rez),
    Sum1 is Sum + E,
    Sum1 =< S,
    submultime_aux(Rez, S, C, Sum1, [E|[H|Col]]).