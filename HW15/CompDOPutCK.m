% CompDOPutCK.m Compare blsprice and BlsHalton

S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.4;
Sb=40;
Smax=100;
dS=0.5;
dT=5/2400;

DownOutPut=DOPut(S0,X,r,T,sigma,Sb);
DownOutPutCK=DOPutCK(S0,X,r,T,sigma,Sb,Smax,dS,dT);

DownOutPut
DownOutPutCK

