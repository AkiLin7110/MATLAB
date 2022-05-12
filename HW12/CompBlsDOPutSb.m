% CompBlsDOPutSb.m Compare blsprice and DOPut

S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.4;
Sb1=40;
Sb2=35;
Sb3=30;
Sb4=1;
[Call,Put]=blsprice(S0,X,r,T,sigma);

DOPut40=DOPut(S0,X,r,T,sigma,Sb1);
DOPut35=DOPut(S0,X,r,T,sigma,Sb2);
DOPut30=DOPut(S0,X,r,T,sigma,Sb3);
DOPut1=DOPut(S0,X,r,T,sigma,Sb4);

Put
DOPut40
DOPut35
DOPut30
DOPut1
