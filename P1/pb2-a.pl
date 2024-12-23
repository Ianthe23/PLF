%Sa se scrie un predicat care determina cel mai mic multiplu al
% elementelor unei liste formate din numere intregi.
%
%cmmdc(A:Integer, B:Integer, Rez:Integer) (i,i,o) - determinist
cmmdc(A, 0, A):-!.
cmmdc(A, B, Rez):-
    C is A mod B,
    cmmdc(B, C, Rez).

%cmmmc(L:list, Rez:Integer)
cmmmc([], 1) :- !.
cmmmc([H|T], Rez) :-
    cmmmc(T, PartRez),
    cmmdc(H, PartRez, GCD),
    Rez is (H * PartRez) // GCD.
