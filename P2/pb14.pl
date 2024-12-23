% Predecesorul unui numar reprezentat ca lista
%
% predecesor(L:list, Transport:Integer, Rez:list) (i,o,o) - det.
predecesor([], 1, []):-!.
predecesor([H|T], Transport, [Cifra|Rez]):-
    predecesor(T, TransportCurent, Rez),
    (H =:= 0 -> Cifra is 10 - TransportCurent, Transport = 1;
    Cifra is H - TransportCurent, Transport = 0).

% main(L:list, Rez:list) (i,o) - det.
main14(L, Rez):-
    L = [0], !,
    Rez = -1.
main14(L, Rez):-
    predecesor(L, _, [H|T]),
    (H =:= 0 -> Rez = T; Rez = [H|T]).
