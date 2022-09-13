male(pritam).
male(sanjoy).
male(ratan).
male(khokon).
male(rishu).
male(debjit).
male(modan).
male(hari).

female(rani).
female(boni).
female(jhuma).
female(bina).
female(madhbi).
female(prinka).
female(rahi).

parent(hari,ratan).
parent(hari,modan).
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
grandson(X,Y):-grandparent(Y,X),male(Y),write(X),write(" is grand son of "),write(Y).
wife(X,Y):-parent(X,Z),parent(Y,Z),male(Y),female(X).

cousin(X,Y):- parent(M,X),cousin(M,N),parent(N,Y), X \== Y,!.
cousin(X,Y):-parent(M,X),brother(M,N),parent(N,Y), X \== Y,!.
cousin(X,Y):-parent(M,X),sister(M,N),parent(N,Y), X \==Y.


uncle(X,Y):-parent(M,Y),brother(X,M),male(X),!.
uncle(X,Y):-parent(M,Y),sister(X,M),male(X),!.
uncle(X,Y):-parent(M,Y),cousin(X,M),male(X).

prediceser(X,Y):-parent(X,Y).
prediceser(X,Y):-parent(X,Z),prediceser(Z,Y).