%Butterfly
clear;
c1 = 6;
c2 = 3;
c3 = 1;
X1 = 95; %long 
X2 = 100; %short
X3 = 105; %long
S0 = 90:1:110;
plot(S0,max(S0-X1,0)-c1,'--');
hold on;
plot(S0,(max(S0-X3,0)-c3),'.');
plot(S0,-2*(max(S0-X2,0)-c2),'*');
plot(S0,max(S0-X1,0)-c1+(max(S0-X3,0)-c3)+-2*(max(S0-X2,0)-c2));
grid on;
title('Butterfly Spread');
xlabel('S0');
ylabel('Profit');
plot(S0,zeros(1,21),'black');