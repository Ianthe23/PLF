% Sa se calculeze suma alternanta a elementelor unei liste
% (l1 - l2 + l3 ...).
%
% suma_alternanta(L:list, F:Integer, Sum:Integer), (i,i,o) - det.
suma_alternanta([], _, 0):-!.
suma_alternanta([H|T], 0, Sum):-!,
    suma_alternanta(T, 1, Sum1),
    Sum is Sum1 + H.
suma_alternanta([H|T], 1, Sum):-
    suma_alternanta(T, 0, Sum1),
    Sum is Sum1 - H.

