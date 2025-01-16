candidat(A, _, A).
candidat(A, B, E):-
    A1 is A + 1,
    A1 =< B,
    candidat(A1, B, E).

submultimi_nrimpar(A, B, C):-
    candidat(A, B, E),
    submultimi_nrimpar_aux(A, B, C, E, [E]).

submultimi_nrimpar_aux(_, _, Col, Sum, Col):-
    Rest is Sum mod 2,
    Rest =:= 1.
submultimi_nrimpar_aux(A, B, C, Sum, [H|Col]):-
    candidat(A, B, E),
    H > E,
    Sum1 is Sum + E,
    submultimi_nrimpar_aux(A, B, C, Sum1, [E|[H|Col]]).

f([],0).
f([H|T],S):-H mod 2 =:= 0, !, f(T,S1), S is S1+1.
f([_|T],S):-f(T,S1), S is S1.
