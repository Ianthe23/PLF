%Sa se scrie o functie care descompune o lista de numere intr-o lista de
% forma [ lista-de-numere-pare lista-de-numere-impare] (deci lista cu
% doua elemente care sunt liste de intregi), si va intoarce si numarul
% elemente lor pare si impare.
%
% pare(L:list, C:Integer, Rez:list) - (i,o,o) - determinist
pare([], 0, []):-!.
pare([H|T], C, [H|Rez]):-
    H mod 2 =:= 0, !,
    pare(T, C1, Rez),
    C is C1 + 1.
pare([_|T], C, Rez):-
    pare(T, C, Rez).

% impare(L:list, C:Integer, Rez:list) - (i,i,o) - determinist
impare([], 0, []):-!.
impare([H|T], C, [H|Rez]):-
    H mod 2 =:= 1, !,
    impare(T, C1, Rez),
    C is C1 + 1.
impare([_|T], C, Rez):-
    impare(T, C, Rez).

% prelucreaza(L:list, Cp:Integer, Ci:Integer, Rez:list), (i,i,i,o,i) -
% determinist
prelucreaza(L, Cp, Ci, [Pare, Impare]):-
    pare(L, Cp, Pare),
    impare(L, Ci, Impare).



