man(markus).
indian(markus).
not(indian(john)).
die(X,Now):-indian(X),gt(Now,79),write(X),write('is dead').
gt(Op1,Op2):-Op1>Op2.
alive(X,Now):-not(die(X,Now)).
