% Sa se scrie un predicat care transforma o lista intr-o multime, in
% ordinea ultimei aparitii. Exemplu: [1,2,3,1,2] e transformat in
% [3,1,2].
%
% cauta(L:list, E:Integer, IndexCurent:Integer, IndexFinal:Integer,
% Poz:Integer)   (i,i,i,i,o) - determinist
cauta([], _, _, IndexFinal, IndexFinal):-!.
cauta([H|T], E, IndexCurent, _, Poz):-
    H =:= E, !,
    IndexUrmator is IndexCurent + 1,
    cauta(T, E, IndexUrmator, IndexCurent, Poz).
cauta([_|T], E, IndexCurent, IndexFinal, Poz):-
    IndexUrmator is IndexCurent + 1,
    cauta(T, E, IndexUrmator, IndexFinal, Poz).

% transformare(L:list, C:list, Rez:list) (i,i,o) - det.
transformare([], _, []):-!.
transformare([H|T], [_|Coada], Rez):-
    cauta(Coada, H, 1, -1, Poz),
    Poz > 0, !,
    transformare(T, T, Rez).
transformare([H|T], [_|Coada], [H|Rez]):-
    cauta(Coada, H, 1, -1, Poz),
    Poz =:= -1, !,
    transformare(T, T, Rez).
