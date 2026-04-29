possible(X,Y,XX,YY) :- number(X,Y,_), area(XX,YY,_).
row(X,Y,XX,YY) :- possible(X,Y,XX,YY), X = XX.
col(X,Y,XX,YY) :- possible(X,Y,XX,YY), Y = YY.
ok(X,Y,XX,YY) :- row(X,Y,XX,YY).
ok(X,Y,XX,YY) :- col(X,Y,XX,YY).
1 { target(X,Y,XX,YY) : ok(X,Y,XX,YY) } 1 :- number(X,Y,_).

#show target/4.