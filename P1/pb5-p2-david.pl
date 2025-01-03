%a)Get the list of positions of the maximal element in a given list
%
% maximal(L:list, Maxim), (i,o) - determinist
maximal([], -1):-!.
maximal([H|T], MaximNou):-
    maximal(T, Maxim),
    H > Maxim, !,
    MaximNou = H.
maximal([_|T], Maxim):-
    maximal(T, Maxim).

% positions(L:list, I:Integer, Maxim:Integer, Rez:list) (i,i,i,o) -
% determinist
positions([], _, _, []):-!.
positions([H|T], I, Maxim, [I|Rez]):-
    H =:= Maxim, !,
    Index is I + 1,
    positions(T, Index, Maxim, Rez).
positions([_|T], I, Maxim, Rez):-
    Index is I + 1,
    positions(T, Index, Maxim, Rez).

% list_of_pos(L:list, C:list, Rez:list) (i,i,o) - determinist
list_of_pos(L, C, Rez):-
    maximal(C, Maxim),
    positions(L, 1, Maxim, Rez).

%b)
alter([], []):-!.
alter([H|T], [Rez|Result]):-
    is_list(H), !,
    list_of_pos(H, H, Rez),
    alter(T, Result).
alter([H|T], [H|Result]):-
    number(H),
    alter(T, Result).
