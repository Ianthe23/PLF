% Dandu-se o valoare N, se cere sa se genereze permutarile de N elemente
% cu proprietatea ca oricare ar fi 2<=i<=n exista un 1<=j<=i astfel
% incat |v(i)-v(j)|=1.
%
% prelucreaza(L:List, C:list, Index:Integer) - (i,i,i) - det.
% L - lista pe care o parcurg
% C - lista copie pe care verific proprietatea data
% Index - pornesc de la 2, ca sa verific in jos pana la 1 si tot asa,
%         de la indexul 3 la 1 etc.
prelucreaza([], _, _):-!.
prelucreaza([H|T], C, Index):-
    Copie = C,
    verifica_proprietate(Copie, H, Index, 1),
    IndexNou is Index + 1,
    prelucreaza(T, C, IndexNou).

% verifica_proprietate(L:list, Nr:Integer, IndexOprire:Integer,
% Index:Integer) (i,i,i,i) - det.
% L - lista pe care o parcurg
% Nr - elementul de pe pozitia i cu care verific pe rand elementele de
%      pe pozitia j
% IndexOprire - indexul unde ma opresc (pornesc de la 1 si ma opresc la
%               pozitia i din proprietate
% Index - indexul curent, de il incrementez mereu si sa fie mai mic
%         decat IndexOprire
verifica_proprietate([H|_], Nr, _, _):-
    Dif is H - Nr,
    abs(Dif) =:= 1, !.
verifica_proprietate([_|T], Nr, IndexOprire, Index):-
    Index < IndexOprire,
    IndexNou is Index + 1,
    verifica_proprietate(T, Nr, IndexOprire, IndexNou).

% apare(Nr:Integer, L:list) (i,i) - determinist
% Nr - numarul pe care-l caut in lista
% L - lista unde caut numarul
apare(Nr, [Nr|_]):-!.
apare(Nr, [_|T]):-
    apare(Nr, T).

% candidat(N:Integer, I:Integer) (i,o) - nedeterminist
% N - numarul maxim de generat
% I - candidatul generat
candidat(N, N).
candidat(N, I):-
    N > 1,
    N1 is N - 1,
    candidat(N1, I).

% permutari(N:Integer, Rez:list) (i,o) - nedeterminist
% N - numarul de elemente de generat in permutare
% Rez - permutarea curenta generata
permutari(N, Rez):-
    candidat(N, I),
    permutari_aux(N, [H|T], 1, [I]),
    Copie = T,
    prelucreaza(Copie,[H|T] , 2),
    Rez = [H|T].

% permutari_aux(N:Integer, L:list, Lg:Integer, Col:list)
% (i,o,i,i) - nedeterminist
% N - nr de elemente de generat in permutare
% L - permutarea generata de returnat
% Lg - lungimea curenta a permutarii
% Col - permutarea in care adaug candidati
permutari_aux(N, Col, N, Col):-!.
permutari_aux(N, L, Lg, Col):-
    candidat(N, I),
    \+apare(I, Col), %(i,i)
    Lg1 is Lg + 1,
    permutari_aux(N, L, Lg1, [I|Col]).

