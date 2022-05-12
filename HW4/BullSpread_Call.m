%Bull Spread(Call)
clear;
c1 = 3;
c2 = 1;
X1 = 100;
X2 = 105;
S0 = 95:1:110;
plot(S0,max(S0-X1,0)-c1,'--');
hold on;
plot(S0,-(max(S0-X2,0)-c2),'.');
plot(S0,max(S0-X1,0)-c1-(max(S0-X2,0)-c2));
grid on;
title('Bull Spread');
xlabel('S0');
ylabel('Profit');
plot(S0,zeros(1,16),'black');
