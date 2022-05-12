%Bull Spread(Put)
clear;
p1 = 1; %long
p2 = 3; %short
X1 = 100;
X2 = 105;
S0 = 95:1:110;
plot(S0,max(X1-S0,0)-p1,'--');
hold on;
plot(S0,-(max(X2-S0,0)-p2),'.');
plot(S0,max(X1-S0,0)-p1-(max(X2-S0,0)-p2));
grid on;
title('Bull Spread (Put)');
xlabel('S0');
ylabel('Profit');
plot(S0,zeros(1,16),'black');
