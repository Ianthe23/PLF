% Sa se adauge dupa fiecare element dintr-o lista divizorii elementului.
%
% divizori(L:list, Nr:Integer, Div:Integer, Rez:list) (i,i,i,o) - det.
divizori(L, Nr, Div, Rez):-
    Div >= Nr, !,
    Rez = L.
divizori(L, Nr, Div, [Div|Rez]):-
    Rest is Nr mod Div,
    Rest =:= 0, !,
    DivNou is Div + 1,
    divizori(L, Nr, DivNou, Rez).
divizori(L, Nr, Div, Rez):-!,
    DivNou is Div + 1,
    divizori(L, Nr, DivNou, Rez).

% prelucrare(L:list, Rez:list) (i,o) - det.
prelucrare1([], []):-!.
prelucrare1([H|T], Lista):-
    prelucrare1(T, Rez),
    divizori(Rez, H, 2, Result),
    Lista = [H|Result].
