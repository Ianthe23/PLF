% Sa se elimine toate aparitiile elementului maxim dintr-o lista de
% numere intregi.
%
% det_maxim(L:list, Max:integer, Rez:integer) (i,i,o)
det_maxim([], Max, Max) :- !. %daca lista e vida, atunci Rez e Max
det_maxim([H|T], Max, Rez) :-
    H>Max, !,
   det_maxim(T, H, Rez).  %daca primul el > Max, atunci noul Max e primul
                          %element
det_maxim([_|T], Max, Rez) :- det_maxim(T, Max, Rez). %daca nu e mai mic
% decat max, atunci continui cautarea in Tail


% prelucrare(L:list, Max:integer, Rez:list) (i,i,o)
prelucrare([], _, []) :- !. %daca lista e vida, atunci Rez e vida
prelucrare([H|T], Max, [H|Rez]) :-
    H=\=Max, !,
    prelucrare(T, Max, Rez). %daca primul element e dif de max, il bag in
                             %Rez
prelucrare([_|T], Max, Rez) :- prelucrare(T, Max, Rez). %altfel continui
% prelucrarea, daca H e egal cu Max

% elimina_maxim(L:list, Rez:list) (i,o)
elimina_maxim(L, Rez) :-
    det_maxim(L, -inf, Max), %determin maximul
    prelucrare(L, Max, Rez). %prelucrez lista stiind maximul
