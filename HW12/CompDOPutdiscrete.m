% CompDOPutdiscrete.m Compare blsprice and DOPut

S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.4;
Sb1=40;
Sb2=40*exp(-0.5826*0.4*sqrt(1/12/30));
Sb3=30;
Sb4=30*exp(-0.5826*0.4*sqrt(1/12/30));

[Call,Put]=blsprice(S0,X,r,T,sigma);

DOPut40=DOPut(S0,X,r,T,sigma,Sb1);
DOPut40discrete=DOPut(S0,X,r,T,sigma,Sb2);
DOPut30=DOPut(S0,X,r,T,sigma,Sb3);
DOPut30discrete=DOPut(S0,X,r,T,sigma,Sb4);

Put
DOPut40
DOPut40discrete
DOPut30
DOPut30discrete

