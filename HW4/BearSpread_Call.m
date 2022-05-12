%Bear Spread(Call)
clear;
c1 = 3; %short
c2 = 1; %long
X1 = 100;
X2 = 105;
S0 = 95:1:110;
plot(S0,max(S0-X2,0)-c2,'--');
hold on;
plot(S0,-(max(S0-X1,0)-c1),'.');
plot(S0,max(S0-X2,0)-c2-(max(S0-X1,0)-c1));
grid on;
title('Bear Spread (Call)');
xlabel('S0');
ylabel('Profit');
plot(S0,zeros(1,16),'black');
