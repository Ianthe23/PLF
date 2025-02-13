% Definiti un predicat care determina suma a doua numere scrise in
% reprezentare de lista.
%
% lungime(L:list, NrCifre:Integer, Rez:Integer):-(i,i,o) determinist
lungime([], NrCifre, NrCifre):-!.
lungime([_|T], NrCifre, Rez):-
    NrCifreNou is NrCifre + 1,
    lungime(T, NrCifreNou, Rez).


% adauga_zero(L:list, NrZero:Integer, Rez:list) (i,i,o) - determinist
adauga_zero(Lista, 0, Lista):-!.
adauga_zero(Lista, NrZero, [0|Rez]):-
    NrZeroNou is NrZero - 1,
    adauga_zero(Lista, NrZeroNou, Rez).

% completare(L1:list, L2:list, L1Nou:list, L2Nou:list) (i,i,o,o) - det
completare(L1, L2, L1, L2Nou):-
    C1 = L1, C2 = L2,
    lungime(C1, 0, NrCifre1),
    lungime(C2, 0, NrCifre2),
    NrCifre1 > NrCifre2, !,
    Dif is NrCifre1 - NrCifre2,
    adauga_zero(L2, Dif, L2Nou).
completare(L1, L2, L1Nou, L2):-
    C1 = L1, C2 = L2,
    lungime(C1, 0, NrCifre1),
    lungime(C2, 0, NrCifre2),
    NrCifre2 > NrCifre1, !,
    Dif is NrCifre2 - NrCifre1,
    adauga_zero(L1, Dif, L1Nou).
completare(L1, L2, L1, L2).

% suma(L1:list, L2:list, Transport:Integer, Rez:list) - (i,i,i,o) - det.
suma([], [], 0, []):-!.
suma([], [], Transport, [Transport]):-!.
suma([H1|T1], [H2|T2], Transport, [Suma|SumaCurenta]):-
    suma(T1, T2, TransportCurent, SumaCurenta),
    Sum is H1 + H2 + TransportCurent,
    Suma is Sum mod 10,
    Transport is Sum // 10.

main(L1, L2, Rez):-
    completare(L1, L2, L1Nou, L2Nou),
    suma(L1Nou, L2Nou, 0, Rez).

