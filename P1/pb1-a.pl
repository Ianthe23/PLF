%Sa se scrie un predicat care intoarce diferenta a doua multimi.
%
%cauta_elem(L:list, E:Integer, Ok:Integer) (i,i,o) - determinist
% L = lista in care caut elementul
% E = elementul de cautat
% Ok = 1, daca E se afla in lista
%      0, altfel
cauta_elem([], _, 0):-!.
cauta_elem([E|_], E, 1):-!.
cauta_elem([_|T], E, Ok):-cauta_elem(T, E, Ok).

%diferenta(L1:list, L2:list, C:list, Rez:list) (i,i,i,o) - determinist
% L1 = lista din care elimin ce se afla si in L2
% L2 = lista in care caut
% C = copia listei L2
% Rez = rezultatul
diferenta([], _, _, []):-!.
diferenta([H|T], L2, C, [H|Rez]):-
    cauta_elem(C, H, Ok), Ok < 1, !,
    diferenta(T, L2, C, Rez).
diferenta([_|T], L2, C, Rez):-
    diferenta(T, L2, C, Rez).

%main(L1:list, L2:list, Rez:list) (i,i,o) - determinist
% L1 = lista din care elimin ce se afla si in L2
% L2 = lista in care caut
% Rez = rezultatul
main(L1, L2, Rez):-diferenta(L1, L2, L2, Rez).
