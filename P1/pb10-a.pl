% Sa se intercaleze un element pe pozitia a n-a a unei liste.
%
% intercala(L:list, E:Integer, N:Integer, I:Integer, Rez:list)
% (i,i,i,i,o)
% determinist
intercala([], _, _, _, []):-!.
intercala([H|T], E, N, I, [E,H|Rez]):-
    N =:= I, !,
    Index is I + 1,
    intercala(T, E, N, Index, Rez).
intercala([H|T], E, N, I, [H|Rez]):-
    Index is I + 1,
    intercala(T, E, N, Index, Rez).
