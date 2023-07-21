male(adam).
male(john).
male(joe).
female(rose).
female(lency).
female(gens).
mother(lency,rose).
mother(lence,joe).
mother(lency,john).
mother(lence,gens).
father(adam,jan).
father(adam,jenny).
father(adam,john).
father(adam,joe).
siblings(Sb1,Sb2):- (father(F,Sb1),father(F,Sb2),male(F))|(mother(M,Sb1),mother(M,Sb2),female(M)).
brothers(B1,B2):-siblings(B1,B2),male(B1),male(B2).
sisters(S1,S2):-siblings(S1,S2),female(S1),female(S2).
