%CoveredPut
clear;
p = 2;
X = 100;
S0 = 92:1:112;
plot(S0,100-S0,'--');
hold on;
plot(S0,-(max(X-S0,0)-p),'.');
plot(S0,100-S0-(max(X-S0,0)-p));
grid on;
title('Covered Put');
xlabel('S0');
ylabel('Profit');