% Definiti un predicat care, dintr-o lista de atomi, produce o lista de
% perechi (atom n), unde atom apare in lista initiala de n ori. De ex:
% numar([1, 2, 1, 2, 1, 3, 1], X) va produce X = [[1, 4], [2, 2], [3,
% 1]].
%
% elimina_aparitii(L:list, E:atom, nrAp:Integer, Rez:list), (i,i,o,o,) -
% determinist
elimina_aparitii([], _, 0, []):-!.
elimina_aparitii([E|T], E, NrAp, Rez):-!,
    elimina_aparitii(T, E, NrAp1, Rez),
    NrAp is NrAp1 + 1.
elimina_aparitii([H|T], E, NrAp, [H|Rez]):-
    elimina_aparitii(T, E, NrAp, Rez).

%parcurgere(L:list, X:list) (i,o) - determinist
parcurgere([], []):-!.
parcurgere([H|T], [[H,NrAp]|X]):-
    elimina_aparitii([H|T], H, NrAp, Rez),
    parcurgere(Rez, X).
