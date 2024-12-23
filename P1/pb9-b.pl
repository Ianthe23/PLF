% Sa se construiasca lista (m, ..., n), adica multimea numerelor intregi
% din intervalul [m, n].
%
% lista(M:Integer, N:Integer, Nr:Integer, Rez:list) (i,i,i,o) -
% determinist
lista(_, N, N, [N]):-!.
lista(M, N, Nr, [Nr|Rez]):-
    Nr < N, !,
    Nr1 is Nr + 1,
    lista(M, N, Nr1, Rez).


