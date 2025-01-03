% Sa se determine cea mai lunga secventa de numere pare consecutive
% dintr-o lista (daca sunt mai multe secvente de lungime maxima, una
% dintre ele).
%
% cautare_lungime(L:list, Lg:Integer, LgMax:Integer, Ok:Integer,
% Inc:Integer, IncMax:Integer, Index:Integer) (i,i,o,i,i,o,i)
cautare_lungime([], _, Lgmax, Lgmax, _, _, IncMax, IncMax, _):-!.

cautare_lungime([H1,H2|T], Lg, Lgmax, Lgret, Ok, Inc, IncMax, Incret,Index):-
    Lg =:= 0,
    Rest1 is H1 mod 2,
    Rest2 is H2 mod 2,
    Rest1 =:= 0,
    Rest2 =:= 0,
    Dif is H1 - H2,
    Dif =:= -2, !,
    Ok = 0,
    Lungime is Lg + 1,
    Inc = Index,
    IndexNou is Index + 1,
    cautare_lungime([H2|T], Lungime, Lgmax, Lgret, Ok, Inc, IncMax, Incret, IndexNou).

cautare_lungime([H1,H2|T], Lg, Lgmax, Lgret, Ok, Inc, IncMax, Incret, Index):-
    Lg =:= 0,
    Rest1 is H1 mod 2,
    Rest2 is H2 mod 2,
    Rest1 =:= 0,
    Rest2 =:= 0,
    Dif is H1 - H2,
    Dif =:= 2, !,
    Ok = 1,
    Lungime is Lg + 1,
    Inc = Index,
    IndexNou is Index + 1,
    cautare_lungime([H2|T], Lungime, Lgmax, Lgret, Ok, Inc, IncMax, Incret, IndexNou).

cautare_lungime([H1,H2|T], Lg, Lgmax, Lgret, Ok, Inc, IncMax, Incret,Index):-
    Lg > 0,
    Rest1 is H1 mod 2,
    Rest2 is H2 mod 2,
    Rest1 =:= 0,
    Rest2 =:= 0,
    Dif is H1 - H2,
    DifAbs is abs(Dif),
    DifAbs =:= 2, !,
    Lungime is Lg + 1,
    IndexNou is Index + 1,
    cautare_lungime([H2|T], Lungime, Lgmax, Lgret, Ok, Inc, IncMax, Incret, IndexNou).

cautare_lungime([_|T], Lg, Lgmax, Lgret, Ok, Inc, IncMax, Incret, Index):-
    Lg > 0,
    (Lg > Lgmax -> Lungime is Lg + 1, Lgmax = Lungime, IncMax = inc),
    Inc = 0,
    Lg = 0,
    Ok = 0,
    IndexNou is Index + 1,
    cautare_lungime(T, Lg, Lgmax, Lgret, Ok, Inc, IncMax, Incret, IndexNou).

cautare_lungime([_|T], Lg, Lgmax, Lgret, Ok, Inc, IncMax, Incret, Index):-
    Lg =:= 0,
    IndexNou is Index + 1,
    cautare_lungime(T, Lg, Lgmax, Lgret, Ok, Inc, IncMax, Incret, IndexNou).



