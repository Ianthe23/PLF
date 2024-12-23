% Sa se sorteze o lista cu eliminarea dublurilor. De ex: [4 2 6 2 3 4]
% => % [2 3 4 6]
%
% merge_sort(L:list, Rez:list) (i,o) - determinist
merge_sort1([], []):-!.
merge_sort1([H], [H]):-!.
merge_sort1(List, Rez):-
    divide1(List, L1, L2),
    merge_sort1(L1, S1),
    merge_sort1(L2, S2),
    merge1(S1, S2, Rez).


% divide(L:list, L1:list, L2:list) (i,o,o) - determinist
divide1([], [], []):-!.
divide1([H], [H], []):-!.
divide1([H1, H2|T], [H1|L1], [H2|L2]):-
    divide1(T, L1, L2).

% merge(L1:list, L2:list, Rez:list) (i,i,o) - determinist
merge1(L1, [], L1):-!.
merge1([], L2, L2):-!.
merge1([H1|T1], [H2|T2], [H1|Rez]):-
    H1 < H2, !,
    merge1(T1, [H2|T2], Rez).
merge1([H1|T1], [H2|T2], [H2|Rez]):-
    H1 > H2, !,
    merge1([H1|T1], T2, Rez).
merge1([H1|T1], [H1|T2], Rez):-
    merge1([H1|T1], T2, Rez).

