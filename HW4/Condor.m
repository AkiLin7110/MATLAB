%Condor
clear;
p1 = 3; %long
p2 = 5; %short
c1 = 5; %short
c2 = 3; %long

X1 = 95;
X2 = 100;
X3 = 105;
X4 = 110;

S0 = 90:1:120;

plot(S0,max(X1-S0,0)-p1,'--');
hold on;
plot(S0,-(max(X2-S0,0)-p2),'.');
plot(S0,-(max(S0-X3,0)-c1),'*');
plot(S0,max(S0-X4,0)-c2,'.');

plot(S0,(max(X1-S0,0)-p1)-(max(X2-S0,0)-p2)-(max(S0-X3,0)-c1)+(max(S0-X4,0)-c2));

grid on;
title('Condor');
xlabel('S0');
ylabel('Profit');
plot(S0,zeros(1,31),'black');