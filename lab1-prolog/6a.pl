%Sa se scrie un predicat care elimina dintr-o lista toate elementele
%care se repeta ex: l=[1,2,1,4,1,3,4] => l=[2,3]
%
% elimina_aparitii(L:list, El:integer, Rez:list, NrAp:integer) (i,i,o,o)
elimina_aparitii([], _, [], 0). %cand lista e vida, atunci Rez e vida si
                                %NrAp este 0
elimina_aparitii([El|T], El, Rez, NrAp) :-
    elimina_aparitii(T, El, Rez, NrAp1), !,
    NrAp is NrAp1 + 1.          %cand primul element e cel cautat, elimina
                                %din lista initiala si crestem NrAp
elimina_aparitii([H|T], El, [H|Rez], NrAp) :-
    elimina_aparitii(T, El, Rez, NrAp). %altfel, (H != El), punem H in Rez


%elimina_dup(L:list, Rez:list) (i,o)
elimina_dup([], []). %cand lista e vida, atunci Rez e vida
elimina_dup([H|T], [H|Rez]) :-
    elimina_aparitii(T, H, _, NrAp),
    NrAp =:= 0, !,
    elimina_dup(T, Rez).  %cand NrAp al primului elem e 0 in restul listei
                          %atunci continuam procesarea si il adaugam in
                          %Rez
elimina_dup([H|T], Rez) :-
    elimina_aparitii(T, H, RezAp, _),
    elimina_dup(RezAp, Rez).  %cand NrAp este orice alta valoare decat 0
                              %al primului elem, continui procesarea pe
                              %pe eliminarea aparitiilor iar T devine
                              %RezAp, avand in vedere duplicatele
