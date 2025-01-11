% Dandu-se o lista formata din nr. intregi, sa se genereze lita
% permutarilor avand proprietatea ca valoarea absoluta a diferentei
% dintre doua valori consecutive este <=3.
%
% sterge(L:list, E:list, Rez:list)
% model de flux (i,i,o)
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

% permutare(L:list, N:Integer, C:List)
% model de flux(i,i,o)
permutare(L, N, C):-
    candidat(L, E),
    sterge(L, E, Rez),
    permutare_aux(Rez, N, C, 1, [E]).

% permutare_aux(L:list, N:Integer, C:List, Lg:Integer, Col:list)
% model de flux (i,i,o,i,i)
permutare_aux(_, N, Col, N, Col):-!.
permutare_aux(L, N, C, Lg, [H|Col]):-
    candidat(L, E),
    Lg1 is Lg + 1,
    Lg1 =< N,
    Dif is H - E,
    Modul is abs(Dif),
    Modul =< 3,
    sterge(L, E, Rez),
    permutare_aux(Rez, N, C, Lg1, [E|[H|Col]]).

