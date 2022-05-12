% CompBlsExpl.m Compare blsprice and BlsHalton

S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.4;
Smax=100;
dS=0.5; % dS=2;
dT=5/2400;

[c,p]=blsprice(S0,X,r,T,sigma);
Impl=EuCallImpl(S0,X,r,T,sigma,Smax,dS,dT);

c
Impl

