% 1 sum of n element
sum([],0).
sum([H|[]],H).
sum([H|T],N):-sum(T,N1),N is H+N1. 

% 2 delete 1st element
delete([H|T],T).

% 3 add a element is 1st
addelement(L,H,[H|L]).

% 4 find the element of a list or member (member ta h is find the elment place check it when do this program it is not noarmal)
find([H|T],H).
find([R|T],H):-find(T,H).

% 5 total number of element
total([],0).
total([H|L],N):-total(L,N1),N is N1+1.

% 7 concatenation or add two list or append
concatenation([],L,L).
concatenation([X1|L1],L2,[X1|L3]):- concatenation(L1,L2,L3).

% 6 reverse the list
reverse([], [] ).
reverse([H|T],K):-reverse(T,K1),concatenation(K1,[H],K).

% 7 Find out wether a list is a palindrome
palindrome(L):-reverse(L,L),write("It is palindrome").

% 8 max elment of list
maxelment([],0).
maxelment([H|L],K):- maxelment(L,K1), H >= K1, K is H.
maxelment([H|L],K):- maxelment(L,K1), H =< K1, K is K1.

% 9  duplicate element of list
duplicate([],[]).
duplicate([H|T],[H,H|T2]):- duplicate(T,T2).

% 10 remove duplicatel
dup([],[]).
dup([H|T],R):- find(T, H),dup(T,R).
dup([H|T],[H|R]):- dup(T,R).

%  11 delete last element of the list

delete_last([H|T], L):- delLast(T,L,H).
delLast([],[],_).
delLast([H1|T],[H2|L],H2):- delLast(T,L,H1).

% 12 delete a given element from a list (A is element, list, output)
delectanyl(A, [A|B], B).
delectanyl(A, [B, C|D],[B|E]):-delectanyl(A, [C|D],E).

% 13 union of list
union([],[],[]).
union(List1,[],List1).
union(List1, [Head2|Tail2], [Head2|Output]):- not(member(Head2,List1)),union(List1,Tail2,Output).
union(List1,[Head2|Tail2],Output):- member(Head2,List1),union(List1,Tail2,Output).

% 14 intersection
intersec([],_,[]).
intersec([H1|T1],L2,[H1|Res]):- find(L2,H1),intersec(T1,L2,Res).
intersec([_|T1],L2,Res):-intersec(T1,L2,Res).

% 15 find last element
lastelement([X],X).
lastelement([H|T],X):-lastelement(T,X).

% 16 subset
subset([],[]).
subset([H1|L1],[H1|L2]):-subset(L1,L2).
subset([H1|L1],L2):-subset(L1,L2).


% 17 add element in last of the list
addlast(L,E,R):-concatenation(L,[E],R).