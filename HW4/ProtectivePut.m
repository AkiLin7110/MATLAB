%Protective call

%input
clear;
c = 2;
X = 100;
S0 = 90:1:110;

%plot
plot(S0,100-S0,'--');
hold on; %wait
plot(S0,max(S0-X,0)-c,'.');
plot(S0,100-S0+max(S0-X,0)-c);

grid on;
title('Protective Put');
xlabel('S0');
ylabel('Profit');