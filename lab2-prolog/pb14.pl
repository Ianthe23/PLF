%Definiti un predicat care determina predecesorul unui numar reprezentat
%cifra cu cifra intr-o lista. De ex: [1 9 3 6 0 0] => [1 9 3 5 9 9]
%
% predecesor(L:list, R:Integer, Rez:list), model de flux:(i,o,o),(i,i,o)
%  determinist
% L = lista de cifre
% R = restul de scazut din cifra diferita de 0, care apare inaintea zerourilor
% Rez = lista rezultat, ce
% contine cifrele predecesorului

%daca lista e vida, Rez e vida
predecesor([], _, []):-!.

%daca s-a ajuns la cifra 0, atunci restul e 1 si punem in rezultat 9
predecesor([0], 1, [9]):-!.

%daca s-a ajuns la final la o cifra dif de 0, scadem din ea 1
predecesor([H], 0, [H1]):- H1 is H-1, !.

% daca avem restul 1 si cifra curenta e 0, punem 9 in rezultat si
% continuam cu acelasi rest
predecesor([0|T], 1, [9|Rez]) :- predecesor(T, 1, Rez), !.

% altfel, din cifra scadem restul pe care-l obtinem revenind din
% adancime din backtracking
predecesor([H|T], 0, [H1|Rez]):-
    predecesor(T, R, Rez),
    !, % dupa ce procesam coada, ! confirma ca ar trebui sa calculam H1
       % fara sa luam in considerare alte reguli alternative de mai sus
    H1 is H-R.

%format_numar(L:list, Rez:list), model de flux (i,o), determinist
% L = lista ce contine cifrele predecesorului
% Rez = lista din care stergem 0 daca apare la inceputul listei
% De ex: din [1,0,0] - se obtine dupa predecesor [0,9,9], deci trebuie
% sa stergem acel 0 => [9,9]

%daca prima cifra in Rez e 0, o stergem
format_numar([0|Rez], Rez):-!.

%altfel returnez lista initiala
format_numar(Rez, Rez).


%formatare(L:list, Result:List), model de flux (i,o), determinist
% L = lista ce contine cifrele numarului initial
% Result = lista ce contine cifrele predecesorului, dupa formtarare
formatare(L, Result):-
    predecesor(L, 0, Rez),
    %folosim conditional check
    %daca Rez e diferit de [0], atunci formatez numarul
    %altfel, Result devine Rez-ul obtinut din predecesor
    (Rez \= [0] -> format_numar(Rez, Result) ; Result = Rez).


%Se da o lista eterogena, formata din numere intregi si liste de cifre.
%Pentru fiecare sublista sa se determine predecesorul numarului
%reprezentat cifra cu cifra de lista respectiva.
%
%predecesor_sublista(L:List, Result:List), model de flux (i,o),
%  determinist
% L = lista eterogena
% Result = lista rezultat dupa ce am aplicat predecesor pe subliste

%daca L e vida, atunci si Result e vida
predecesor_sublista([],[]).

% daca primul element din lista e tot lista, o formatez, gasind
% predecesorul, si dupa aceea punel rezultatul in Rezult
predecesor_sublista([H|T],[Rez|Result]):-
    is_list(H), !,
    formatare(H, Rez),
    predecesor_sublista(T, Result).

% daca nu e lista primul element, atunci continuam prelucrarea pe restul
% listei, dar il adaugam si in Result
predecesor_sublista([H|T], [H|Result]):-
    number(H),
    predecesor_sublista(T, Result).

