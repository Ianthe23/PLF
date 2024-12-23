% Definiti un predicat care determina succesorul unui numar reprezentat
% cifra cu cifra intr-o lista. De ex: [1 9 3 5 9 9] => [1 9 3 6 0 0]
%
% succesor(L:list, Transport:Integer, Rez:list), (i,o,o) - det.
succesor([], 1, []):-!.
succesor([H|T], Transport, [Suma|Rez]):-
    succesor(T, TransportCurent, Rez),
    Sum is H + TransportCurent,
    Suma is Sum mod 10,
    Transport is Sum // 10.

% main2(L:list, Rez:list) (i,o) - det.
main2(L, Result):-
    succesor(L, Transport, Rez),
    (Transport \= 0 -> Result = [Transport|Rez]; Result = Rez).
