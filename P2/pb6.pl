% Intr-o lista L sa se inlocuiasca toate aparitiile unui element E cu
% elementele unei alte liste, L1. De ex:
% inloc([1,2,1,3,1,4],1,[10,11],X) va produce
% X=[10,11,2,10,11,3,10,11,4].
%
% insereaza(L1:list, L2:list, Rez:list) (i,i,o), determinist
insereaza([], L, L):-!.
insereaza([H|T], L, [H|Rezultat]):-
    insereaza(T, L, Rezultat).

% prelucreaza(L:list, Elem:Integer, L1:list, Rez:list) (i,i,i,o) - det.
prelucreaza([], _, _, []):-!.
prelucreaza([E|T], E, L,  Rez):-!,
    prelucreaza(T, E, L, Result),
    C = L,
    insereaza(C, Result, Rez).
prelucreaza([H|T], E, L, [H|Rez]):-
    prelucreaza(T, E, L, Rez).
