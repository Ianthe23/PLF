% Sa se construiasca sublista (lm, ..., ln) a listei (l1, ..., lk).
%
% sublista(L:list, M:Integer, N:Integer, I:Index, Rez:list)
% (i,i,i,i,o)
% determinist
sublista([], _, _, _, []):-!.
sublista([H|T], M, N, I, [H|Rez]):-
    I >= M,
    I =< N, !,
    Index is I + 1,
    sublista(T, M, N, Index, Rez).
sublista([_|T], M, N, I, Rez):-
    I < M, !,
    Index is I + 1,
    sublista(T, M, N, Index, Rez).
sublista([_|T], M, N, I, Rez):-
    I > N, !,
    Index is I + 1,
    sublista(T, M, N, Index, Rez).

