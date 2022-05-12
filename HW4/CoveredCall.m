%CoveredCall
clear;
c = 2;
X = 105;
S0 = 92:1:112;
plot(S0,S0-100,'--');
hold on;
plot(S0,-(max(S0-X,0)-c),'.');
plot(S0,S0-100-(max(S0-X,0)-c));
grid on;
title('Covered Call');
xlabel('S0');
ylabel('profit');