capital(goa,panaji).
capital(delhi,newdelhi).
capital(maharashtra,mumbai).
capital(karnataka,bengaluru).
capital(kerala,thiruvanantapuram).
capital(telangana,hyderabad).
capital(rajasthan,jaipur).
capital(gujarat,ahmedabad).

states:-check_no_times(3).

check_no_times(0).
check_no_times(L):- nl, repeat, write('Enter State'), read(S),write('Enter Capital:'),read(C), (capital(S,C)-> write('correct'),nl,fail; not(capital(S,C))-> K is L-1, write('Wrong'), nl, write('No. of attempts left:'), write(K), nl , check_no_times(K)).
