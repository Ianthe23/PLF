% Dandu-se o lista liniara numerica, sa se stearga toate secventele de
% valori consecutive. Ex: sterg([1, 2, 4, 6, 7, 8, 10], L) va produce
% L=[4,10].
%
% parcurgere(L:list, Ok:Integer, NrSuccesor:Integer, Rez:list) (i,o,o)
% - det.
parcurgere([], _, -1, []):-!.
parcurgere([H], 0, H, []):-!.
parcurgere([H1,H2|T], Ok, H1, Result):-
    parcurgere([H2|T], OkAnterior, NrSuccesor, Rez),
    Dif is H1 - NrSuccesor,
    AbsDif is abs(Dif),
    (AbsDif =:= 1 -> Ok = 1, Result = Rez; Ok = 0,(OkAnterior =:= 1 -> Result = Rez; Result = [NrSuccesor|Rez])).

% main(L:list, Rez:list) (i,o) - det.
main3([H|T], Result):-
    parcurgere(T, Ok, NrAnterior, Rez),
    write(NrAnterior),
    Dif is NrAnterior - H,
    AbsDif is abs(Dif),
    (AbsDif =:= 1 -> Result = Rez; Result = [H|Rez]).

