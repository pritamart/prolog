male(pritam).
male(sanjoy).
male(ratan).
male(khokon).
male(rishu).
male(debjit).
male(modan).

female(rani).
female(boni).
female(jhuma).
female(bina).
female(madhbi).
female(prinka).
female(rahi).

parent(sanjoy,pritam).
parent(ratan,sanjoy).
parent(ratan,khokon).
parent(sanjoy,rani).
parent(jhuma,pritam).
parent(bina,boni).
parent(khokon,boni).
parent(jhuma,rani).
parent(debjit,rishu).
parent(debjit,rahi).
parent(prinka,rishu).
parent(prinka,rahi).
parent(modan,debjit).

father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.
sister(X,Y):-parent(X,Z),parent(Z,Y),female(X),X\==Y.
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
grandfather(X,Y):-grandparent(X,Y),male(X).
grandmother(X,Y):-grandparent(X,Y),female(X).
wife(X,Y):-parent(X,Z),parent(Y,Z),male(Y),female(X).
prediceser(X,Y):-parent(X,Y).
prediceser(X,Y):-parent(X,Z),prediceser(Z,Y).

max(X, Y, X) :- X >= Y, !.
max(X, Y, Y) :- X < Y.


find_max(X, Y, X) :- X >= Y, !.
find_max(X, Y, Y) :- X < Y.

maxofthree(X,Y,Z,X):- X >= Y, X >= Z,!.
maxofthree(X,Y,Z,Y):- Y > X, Y >= Z,!.
maxofthree(X,Y,Z,Z):- Z > X, Z > Y.

deletefirstelement([H|T],T).

addelement(L,E,[E|L]).
pushFront(Item, List, [Item|List]).

find([H|T],H):- write("Element is found").
find([R|T],H):-find(T,H).
write("hello").				
list_length([], 0).
list_length([_ | L], N) :-
    list_length(L, N1),
    N is N1 + 1. 
fibo(0,1).
fibo(1,1).
fibo(N,F):-
		N > 1,
		N1 is N-1,
		N2 is N-2,
		fibo(N1,F1),
		fibo(N2,F2),
		F is F1+F2.
		
n_factorial(0, 1).
n_factorial(N, F) :-
        N #> 0,
        N1 #= N - 1,
        n_factorial(N1, F1),
        F #= N * F1.

takeout(X,[X|R],R).
takeout(X,[F|R],[F|S]) :- takeout(X,R,S).
perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).   
perm([],[]).

append([],X,X).
append([X|Y],Z,[X|W]) :- append(Y,Z,W).  
cycle([],L).
cycle([H|T],L):-append(T,H,L),write(L).

prime_factor(N, D) :-
    find_prime_factor(N, 2, D).

find_prime_factor(N, D, D) :-
    0 is N mod D.
find_prime_factor(N, D, R) :-
    D < N,
    (0 is N mod D
    -> (N1 is N/D, find_prime_factor(N1, D, R))
    ;  (D1 is D + 1, find_prime_factor(N, D1, R))
    ).

 