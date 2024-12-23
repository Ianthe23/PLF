% Sa se scrie un predicat care sa testeze daca o lista formata din numere
% intregi are aspect de "vale"(o multime se spune ca are aspect de
% "vale" daca elementele descresc pana la un moment dat, apoi cresc. De
% ex. 10 8 6 9 11 13).
%
% vale(L:list, F:Integer) (i,i) - determinist
vale([_], 1):-!.
vale([H1,H2|T], F) :-
    H1 > H2,
    F < 1, !,
    vale([H2|T], 0).
vale([H1,H2|T], F):-
    H1 < H2,
    F >= 0, !,
    vale([H2|T], 1).

%vale_P(L:list) (i)
vale_p([H1,H2,H3|T]):-
    H1 > H2, !,
    vale([H1,H2,H3|T], -1).

