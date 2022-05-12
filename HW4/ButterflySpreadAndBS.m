%ButterflySpread and BS
clear;
clear;
c1 = 6;
c2 = 3;
c3 = 1;
X1 = 95; %long 
X2 = 100; %short
X3 = 105; %long

r = 0.02; T1 = 0.05; T2 = 0.1; sigma = 0.2;
S0 = 90:1:115;
[m,n] = size(S0);
for i=1:n;
    [C11(i),P11(i)] = fcn_bs(S0(i),X1,r,T1,sigma);
    [C21(i),P21(i)] = fcn_bs(S0(i),X2,r,T1,sigma);
    [C31(i),P31(i)] = fcn_bs(S0(i),X3,r,T1,sigma);
    
    [C12(i),P12(i)] = fcn_bs(S0(i),X1,r,T2,sigma);
    [C22(i),P22(i)] = fcn_bs(S0(i),X2,r,T2,sigma);
    [C32(i),P32(i)] = fcn_bs(S0(i),X3,r,T2,sigma);
end
%plot(S0,max(S0-X1,0)-max(S0-X2,0)-c1+c2);
plot(S0,max(S0-X1,0)-c1+(max(S0-X3,0)-c3)+-2*(max(S0-X2,0)-c2));
hold on;
plot(S0,C11-C21+C31-c1+2*c2-c3,'--');
plot(S0,C12-C22+C32-c1+2*c2-c3,'.');
grid on;
title('Butterfly Spread');
xlabel('S0');
ylabel('Profit');
legend({'t = 0','t = 0.05','t = 0.1'},'Location','SouthEast');