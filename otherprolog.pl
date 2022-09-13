% 1 max of two number
max_two(X,Y,X):- X >= Y,!.
max_two(X,Y,Y):- Y > X.
% 2 max of three number
maxofthree(X,Y,Z,X):- X >= Y, X >= Z,!.
maxofthree(X,Y,Z,Y):- Y > X, Y >= Z,!.
maxofthree(X,Y,Z,Z):- Z > X, Z > Y.

% 3 sum of N number
sum_of_number(0,0).
sum_of_number(N,R):- N > 0,
					N1 is N-1,
					sum_of_number(N1,R1),
					R is R1+N.
					
% 4 sum of 1st 10 even number
even(0,0).
even(N,R):-N > 0,
		  N1 is N-2,
		  even(N1,R1),
		  R is R1+N.
sum_of_even(N,R):-  N1 is N*2,even(N1,R).


% 5.0 sum of odd number
sum_of_odd_number(N,R):-N1 is N*2,odd(N1,R).
odd(0,0).
odd(N,R):-N > 0,
		  N1 is N-2,
		  odd(N1,R1),
		  R is R1+N-1.
% 5.1 different way		  
isodd(0,0).
isodd(N,N):-not(N mod 2 =:= 0),!.
isodd(N,0).

oddsum(0,0).			
oddsum(N,R):-N > 0,
			N1 is N-1,
			oddsum(N1,R1),
			isodd(N,R2),
			R is R2+R1.
		  
% 6 sum of first square of N natural number.
square_of_number(0,0).
square_of_number(N,R):-
						N > 0,
						N1 is N-1,
						square_of_number(N1,R1),
						N2 is N*N,
						R is N2+R1.
% 7 Sum of series 1!+2!+3!.
ser_of_number(0,0).
ser_of_number(N,R):-
						N >= 1,
						N1 is N-1,
						ser_of_number(N1,R1),
						multi(N,R2),
						R is R2+R1.
						
multi(1,1).
multi(N,R):-N >= 1,
            N1 is N-1,
			multi(N1,R1),
			R is R1*N.
% 8 Factoriyal
fact(0,R):-R is 1.
fact(N,R):-
			N >= 1,
			N1 is N-1,
			fact(N1,R1),
			R is N*R1.
			
% 9.1 fibonacci series 0,1,1,2,3,5,8,13,21(straing at 0)
fibo(0,0):-!.
fibo(1,1):-!.
%fibo(2,1):-!.
fibo(N,R):- N > 0,
			N1 is N-1,
			N2 is N-2,
			fibo(N1,R1),
			fibo(N2,R2),
			R is R1+R2.
fioboprint(0):- write('0 ').
fioboprint(N):-
				N > 0,
				N1 is N-1,
				fibo(N,L),
				fioboprint(N1),
				write(L),
				write(' ').
				lastfibo(N):-fioboprint(N-1).
			
			
% 9.2 fibonacci series 1,1,2,3,5,8,13,21 (straing at 0)		 	
fibof(0,1):-!.
fibof(1,1):-!.
fibof(N,R):- N > 1,
			N1 is N-1,
			N2 is N-2,
			fibof(N1,R1),
			fibof(N2,R2),
			R is R1+R2.
 fioboprint1(1):- write('1 '). 
fioboprint1(N):-
				N > 0,
				N1 is N-1,
				fibof(N,L),
				fioboprint1(N1),
				write(L),
				write(' ').

% 10 towers of hanoi
move(1,X,Y,_):-
	write('Move top disk from '),
	write(X),
	write(' to '),
	write(Y),
	write('\n').
move(N,X,Y,Z):-
	N > 1,
	M is N-1,
	move(M,X,Z,Y),
	move(1,X,Y,_),
	move(M,Z,Y,X).
