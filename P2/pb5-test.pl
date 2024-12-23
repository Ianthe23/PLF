% suma unui nr reprezentat cifra cu cifra intr-o lista cu o anumita
% cifra [2,3,3,7] + 6 = [2,3,4,3]
%        [9,9] + 2 = [1,0,1]
%
% suma(L:list, Cifra:Integer, Trans:Integer, Rez:list) (i,i,i,o) - det.
suma([], Cifra, Cifra, []):-!.
suma([H|T], Cifra, Transport, [Suma|Rez]):-
    suma(T, Cifra, TransportCurent, Rez),
    Sum is H + TransportCurent,
    Suma is Sum mod 10,
    Transport is Sum // 10.

% main(L:list, Cifra:Integer, Rez:list) (i,o) - det.
main(L, Cifra, Rez):-
    suma(L, Cifra, Transport, Result),
    (Transport > 0 -> Rez = [Transport|Result]; Rez = Result).
