% Sa se inlocuiasca toate aparitiile unui element dintr-o lista cu un alt
% element.
%
% prelucrare(L:list, E:Integer, Nr:Integer, Rez:list) (i,i,i,o) - det.
prelucrare([], _, _, []):-!.
prelucrare([E|T], E, Nr, [Nr|Rez]):-!,
    prelucrare(T, E, Nr, Rez).
prelucrare([H|T], E, Nr, [H|Rez]):-
    prelucrare(T, E, Nr, Rez).
