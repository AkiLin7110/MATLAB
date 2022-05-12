% CompRandHalton.m

% Rand
rand('seed',0);
subplot(2,2,1);
plot(rand(100,1),rand(100,1),'o');
title('radn uniform distribution');
grid on

% Halton 2 vs 7
subplot(2,2,2);
plot(GetHalton(100,2),GetHalton(100,7),'o');
title('Halton 2 vs 7 uniform distribution');
grid on

% Halton 2 vs 4
subplot(2,2,3);
plot(GetHalton(100,2),GetHalton(100,4),'o');
title('Halton 2 vs 4 uniform distribution');
grid on



