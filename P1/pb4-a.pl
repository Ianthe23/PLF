% Sa se scrie un predicat care substituie intr-o lista un element printr-o
% alta lista.
%
% substituie(L:list E:Integer, Lista:list, Rez:list), (i,i,i,o) -
% determinist
substituie([], _, _, []):-!.
substituie([H|T], E, Lista, [Lista|Rez]):-
    H =:= E, !,
    substituie(T, E, Lista, Rez).
substituie([H|T], E, Lista, [H|Rez]):-
    substituie(T, E, Lista, Rez).
