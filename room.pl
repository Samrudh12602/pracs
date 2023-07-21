room(living).
room(kitchen).
room(dining).
room(bedroom).
door(living,kitchen).
door(living,dining).
door(dining,bedroom).
here(living).
connect(X,Y):-door(X,Y).
connect(X,Y):-door(Y,X).
