% Sa se scrie un predicat care sterge toate aparitiile unui anumit atom
% dintr-o lista.
%
% eliminare(L:list, A:atom, Rez:list), (i,i,o) - determinist
eliminare([], _, []):-!.
eliminare([H|T], A, Rez):-
    atom(H),
    H = A, !,
    eliminare(T, A, Rez).
eliminare([H|T], A, [H|Rez]):-
    eliminare(T, A, Rez).
