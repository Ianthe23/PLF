% Definiti un predicat care intoarce cel mai mare divizor comun al
% numerelor dintr-o lista.
%
% cmmdc(A:Integer, B:Integer, Rez:Integer) (i,i,o) - determinist
cmmdc(A, 0, A):-!.
cmmdc(A, B, Rez):-
    C is A mod B,
    cmmdc(B, C, Rez).

% prelucrare(L:list, Cmmdc:Integer) (i,o) - determinist
prelucrare([H], H):-!.
prelucrare([H1,H2], Rez):-!,
    cmmdc(H1, H2, Rez).
prelucrare([H1,H2,H3|T], Rez):-
    cmmdc(H1, H2, Result),
    Lista = [Result,H3|T],
    prelucrare(Lista, Rez).
