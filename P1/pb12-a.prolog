% Sa se scrie un predicat care substituie intr-o lista un element prin
% altul.
%
% substituie(L:list, E1:Integer, E2:Integer, Rez:list) (i,i,i,o) - det.
substituie([], _, _, []):-!.
substituie([E1|T], E1, E2, [E2|Rez]):-!,
    substituie(T, E1, E2, Rez).
substituie([H|T], E1, E2, [H|Rez]):-
    substituie(T, E1, E2, Rez).
