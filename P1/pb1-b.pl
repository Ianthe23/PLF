%Sa se scrie un predicat care adauga intr-o lista dupa fiecare element
% par valoarea 1.
%
%insereaza(L:list, Rez:list) (i,o) - determinist
insereaza([], []):-!.
insereaza([H|T],[H,1|Rez]):-
    H mod 2 =:= 0, !,
    insereaza(T, Rez).
insereaza([H|T], [H|Rez]):-
    insereaza(T, Rez).
