% Sa se sorteze o lista cu pastrarea dublurilor. De ex: [4 2 6 2 3 4]
% => %[2 2 3 4 4 6]
%
% merge_sort(L:list, Rez:list) (i,o) - determinist
merge_sort([], []):-!.
merge_sort([H], [H]):-!.
merge_sort(List, Rez):-
    divide(List, L1, L2),
    merge_sort(L1, S1),
    merge_sort(L2, S2),
    merge(S1, S2, Rez).


% divide(L:list, L1:list, L2:list) (i,o,o) - determinist
divide([], [], []):-!.
divide([H], [H], []):-!.
divide([H1, H2|T], [H1|L1], [H2|L2]):-
    divide(T, L1, L2).

% merge(L1:list, L2:list, Rez:list) (i,i,o) - determinist
merge(L1, [], L1):-!.
merge([], L2, L2):-!.
merge([H1|T1], [H2|T2], [H1|Rez]):-
    H1 =< H2, !,
    merge(T1, [H2|T2], Rez).
merge([H1|T1], [H2|T2], [H2|Rez]):-
    merge([H1|T1], T2, Rez).
