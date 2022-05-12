%CompBlsMc.m
S0=50;
X=52;
r=0.1;
T=5/12;
sigma=0.4;
NRepl1=100000;
NRepl2=200000;
Bls = blsprice(S0,X,r,T,sigma);

randn('seed',0);
[MC1000,CI1000] = BlsMC(S0,X,r,T,sigma,NRepl1)
randn('seed',0);
[MC200000,CI200000] = BlsMC(S0,X,r,T,sigma,NRepl2)