% CompBlsDOPutVol.m Compare blsprice and DOPut

S0=50;
X=50;
r=0.1;
T=5/12;
sigma1=0.4;
sigma2=0.3;
Sb1=40;
Sb2=30;

[Call,Put4]=blsprice(S0,X,r,T,sigma1);
[Call,Put3]=blsprice(S0,X,r,T,sigma2);

DOPut440=DOPut(S0,X,r,T,sigma1,Sb1);
DOPut340=DOPut(S0,X,r,T,sigma2,Sb1);
DOPut430=DOPut(S0,X,r,T,sigma1,Sb2);
DOPut330=DOPut(S0,X,r,T,sigma2,Sb2);

Put4
Put3
DOPut440
DOPut340
DOPut430
DOPut330
