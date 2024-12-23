% substituie (L:list, Lista:List, Rez:list)
% L - lista pe care o parcurg ca sa ii adaug elementele Rezului
% Lista - lista de la care incep, caruia ii adaug
% Rez - lista rezultata
substituie([], L, L):-!.
substituie([H|T], L, [H|Rez]):-
    substituie(T, L, Rez).

% prelucrare(L:list, E:Integer, Lista:List, NrAp:Integer, Rez:list)
% (i,i,i,i,o)
% determinist
% L - lista pe care o parcurg
% E - elementul dat de il caut in L
% Lista - lista cu care inlocuiesc elementul
% NrAp - numarul de aparitii a elementului
% Rez - lista rezultat prin inlocuirea elementului cu lista
prelucrare([], _, _, _, []):-!.
prelucrare([E|T], E, Lista, NrAp, Concat):-
    Rest is NrAp mod 2,
    Rest =:= 1, !,
    NrAp1 is NrAp + 1,
    prelucrare(T, E, Lista, NrAp1, Rez),
    substituie(Lista, Rez, Concat).
prelucrare([E|T], E, Lista, NrAp, [E|Rez]):-
    Rest is NrAp mod 2,
    Rest =:= 0, !,
    NrAp1 is NrAp + 1,
    prelucrare(T, E, Lista, NrAp1, Rez).
prelucrare([H|T], E, Lista, NrAp, [H|Rez]):-
    prelucrare(T, E, Lista, NrAp, Rez).

% main(L:list, E:Integer, Lista:list, Rez:list) (i,i,i,o)
% determinist
% L - lista de o parcurg
% E - elementul dat de inlocuit
% Lista - lista cu care inlocuiesc elementul
% Rez - lista rezultat
main(L, E, Lista, Rez):-
    prelucrare(L, E, Lista, 1, Rez).
