% Sa se scrie un predicat care elimina primele 3 aparitii ale unui
% element intr-o lista. Daca elementul apare mai putin de 3 ori, se va
% elimina de cate ori apare.
%
% elimina_aparitii(L:list, E:Integer, Nr:Integer, NrAp:Integer,
% Rez:list) (i,i,i,i,o)
elimina_aparitii([], _, _, _, []):-!.
elimina_aparitii([H|T], E, Nr, NrAp, Rez):-
    H == E,
    NrAp < Nr, !,
    NrAp1 is NrAp + 1,
    elimina_aparitii(T, E, Nr, NrAp1, Rez).
elimina_aparitii([H|T], E, Nr, NrAp, [H|Rez]):-
    elimina_aparitii(T, E, Nr, NrAp, Rez).
