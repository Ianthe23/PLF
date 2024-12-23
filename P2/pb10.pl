% Se da o lista de numere intregi. Se cere sa se scrie de 2 ori in lista
% fiecare numar prim
%
% nr_prim(Nr:Integer, Div:Integer) (i,i) - det.
nr_prim(Nr, Div):-
    Div >= Nr.
nr_prim(Nr, Div):-
    Rest is Nr mod Div,
    Rest =\= 0, !,
    DivNou is Div + 1,
    nr_prim(Nr, DivNou).

% adaugare(L:list, Rez:list) (i,o) - det.
adaugare([], []):-!.
adaugare([H|T], [H,H|Rez]):-
    H = 2, !,
    adaugare(T, Rez).
adaugare([H|T], [H,H|Rez]):-
    H > 2,
    nr_prim(H, 2), !,
    adaugare(T, Rez).
adaugare([H|T], [H|Rez]):-
    adaugare(T, Rez).

