%Sa se scrie un predicat care adauga dupa 1-ul, al 2-lea, al 4-lea, al
% 8-lea ... element al unei liste o valoare v data.
%
% verifica_putere(Nr:Integer, Ok:Integer) (i,o) - determinist
verifica_putere(1):-!.
verifica_putere(Nr):-
    Nr > 1,
    Nr mod 2 =:= 0,
    N1 is Nr // 2,
    verifica_putere(N1).

% insereaza(L:list, C:Integer, E:Integer, Rez:list) (i,i,i,o) -
% determinist
insereaza([], _, _, []).
insereaza([H|T], C, E, [H,E|Rez]):-
    verifica_putere(C), !,
    C1 is C + 1,
    insereaza(T, C1, E, Rez).
insereaza([H|T], C, E, [H|Rez]):-
    C1 is C + 1,
    insereaza(T, C1, E, Rez).

