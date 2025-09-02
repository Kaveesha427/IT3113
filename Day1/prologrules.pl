friends(x,y):-likes(x,y),likes(y,x).
hates(x,y):-not(likes(x,y)).
enemies(x,y):-not(likes(x,y)),not(likes(x,y)).
