%CompExpImplCK_AmPut.m
S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.3;
Sb = 40;
Smax=100;
dS=2;
dT=5/1200;

Explp = AmPutExpl1(S0,X,r,T,sigma,Smax,dS,dT)
Implp = AmPutImpl(S0,X,r,T,sigma,Smax,dS,dT)
CKp = AmPutCK(S0,X,r,T,sigma,Smax,dS,dT)