% Sa se scrie un predicat care intoarce reuniunea a doua multimi.
%
% verificare(L:list, E:Integer) (i,i,o) - determinist
% aici fac A-B
verificare([], _).
verificare([H|T], E):-
    H =\= E, !,
    verificare(T, E).

% reuniune(L1:list, L2:list, C:Rez:list) (i,i,i,o) - determinist
% aici reunesc A-B cu B
reuniune([], [], [], []):-!.
reuniune([], L2, L2, L2):-!.
reuniune([H|T], L2, C, [H|Rez]):-
    verificare(C, H), !,
    reuniune(T, L2, L2, Rez).
reuniune([_|T], L2, C, Rez):-
    reuniune(T, L2, C, Rez).
