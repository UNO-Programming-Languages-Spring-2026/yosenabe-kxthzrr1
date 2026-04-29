possible(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_).
row(X,Y,XX,YY) :- possible(X,Y,XX,YY), X = XX.
col(X,Y,XX,YY) :- possible(X,Y,XX,YY), Y = YY.
ok(X,Y,XX,YY) :- row(X,Y,XX,YY).
ok(X,Y,XX,YY) :- col(X,Y,XX,YY).
1 { target(X,Y,XX,YY) : ok(X,Y,XX,YY) } 1 :- number(X,Y,_).

empty(A) :- area(_,_,A), not target(_,_,XX,YY) : area(XX,YY,A).
:- empty(A).

mark(X,Y,X,Y) :- target(X,Y,_,_).

mark(X,Y,P+1,Y) :- mark(X,Y,P,Y), target(X,Y,XX,Y), P < XX, cell(P+1,Y).
mark(X,Y,P-1,Y) :- mark(X,Y,P,Y), target(X,Y,XX,Y), XX < P, cell(P-1,Y).

mark(X,Y,X,Q+1) :- mark(X,Y,X,Q), target(X,Y,X,YY), Q < YY, cell(X,Q+1).
mark(X,Y,X,Q-1) :- mark(X,Y,X,Q), target(X,Y,X,YY), YY < Q, cell(X,Q-1).

:- mark(X1,Y1,P,Q), mark(X2,Y2,P,Q), (X1,Y1) != (X2,Y2).

#show target/4.