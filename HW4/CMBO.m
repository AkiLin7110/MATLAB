%CMBO
clear;
c = 1;
p = 6;

X = 105; %K:out-of the money call
X1 = 100; %K:at-the money put

S0 = 92:1:112;
%plot(S0,S0-100,'.');
plot(S0,S0-100-(max(S0-X,0)-c)-(max(X1-S0,0)-p));
hold on;

plot(S0,S0-100-(max(S0-X,0)-c),'*');
plot(S0,-(max(X1-S0,0)-p),'*');

plot(S0,S0-100,'.');
plot(S0,-(max(S0-X,0)-c)-(max(X1-S0,0)-p),'.')


grid on;
title('CMBO');
xlabel('S0');
ylabel('Profit');
legend({'CMBO','Covered Call (out)','Short Naked Put (at)','Long Stock','Short Strangle'},'Location','SouthEast');