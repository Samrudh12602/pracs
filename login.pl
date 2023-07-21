valid_pass(abc).
valid_user(sam).

userip:- check_no_times(3).

check_no_times(0):-write('You have reached the limit of attempts').

check_no_times(L):- nl, repeat, write('Enter Username:'),read(N), write('Enter password:'), read(P), (login(N,P)-> write('valid user'),!; not(login(N,P)) -> K is L-1, write('invalid Credentials'), nl, check_no_times(K)).

login(M,Q):- valid_user(M),valid_pass(Q).
