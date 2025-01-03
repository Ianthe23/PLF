%  Sa se scrie un predicat care testeaza daca o lista este multime.
%
% verifica_aparitii(L:list, E:Integer), (i,i) - determinist
verifica_aparitii([], _).
verifica_aparitii([H|T], E):-
    H \= E,
    verifica_aparitii(T, E).

% multime(L:list), (i) - determinist
multime([]).
multime([H|T]):-
    verifica_aparitii(T, H),
    multime(T).
