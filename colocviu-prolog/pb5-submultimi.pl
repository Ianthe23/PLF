% Determinati lista submultimilor cu cel putin un element, avand suma
% divizibila cu 3.
%
% sterge(L:list, E:Integer, Rez:List)
% model de flux (i,i,o)
sterge([], _, []):-!.
sterge([H|T], E, [H|Rez]):-
    H \= E, !,
    sterge(T, E, Rez).
sterge([E|T], E, T).

% candidat(L:list, E:Integer)
% model de flux (i,o)
candidat([E|_], E).
candidat([_|T], E):-
    candidat(T, E).

% submultime(L:list, C:List)
% model de flux (i,o)
submultime_suma(L, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    submultime_aux_suma(Rez, C, E, [E]).

% submultime_aux(L:list, C:list, Sum:Integer, Col:list)
% model de flux(i,o,i,i)
submultime_aux_suma(_, Col, Sum, Col):-
    Rest is Sum mod 3,
    Rest =:= 0, !.
submultime_aux_suma(L, C, Sum, [H|Col]):-
    candidat(L, E),
    H >= E,
    Sum1 is Sum + E,
    sterge(L, E, Rez),
    submultime_aux_suma(Rez, C, Sum1, [E|[H|Col]]).
