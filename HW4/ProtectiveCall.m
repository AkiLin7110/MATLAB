%Protective Call

%input
clear;
p = 2;
X = 100;
S0 = 90:1:110;
%plot
plot(S0,S0-100,'--');
hold on; %wait
plot(S0,max(X-S0,0)-p,'.');
plot(S0,S0-100+max(X-S0,0)-p);
grid on;
title('protective call');
xlabel('S0');
ylabel('payoff');