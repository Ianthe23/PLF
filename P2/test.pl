% Pastrarea numai primei aparitii a fiecarui numar dintr-o lista.
%
% eliminare(L:list, E:Integer, Rez:list) (i,i,o) - det.
eliminare([], _, []):-!.
eliminare([E|T], E, Rez):-!,
    eliminare(T, E, Rez).
eliminare([H|T], E, [H|Rez]):-
    eliminare(T, E, Rez).

% prelucrare_test(L:list, Rez:list) (i,o) - det.
prelucrare_test([], []):-!.
prelucrare_test([H|T], [H|Rez]):-
    eliminare(T, H, Result),
    prelucrare_test(Result, Rez).
