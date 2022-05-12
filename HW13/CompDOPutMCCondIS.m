% CompDOPutMCCondIS.m Compare DOPutMC,MCcond

S0=50;
X=52;
r=0.1;
T=2/12;
sigma=0.4;
Sb=30;
NStep=60;
NRepl=10000;
bp0=0;
bp20=20;
bp50=50;
bp200=200;

randn('seed',0);
[DOPutMC,CI1,NCrossed1]=DOPutMC(S0,X,r,T,sigma,Sb,NStep,NRepl);
randn('seed',0);
[DOPutMCCondIS0,CI2,NCrossed2]=DOPutMCCondIS(S0,X,r,T,sigma,Sb2,NStep,NRepl,bp0);
randn('seed',0);
[DOPutMCCondIS20,CI3,NCrossed3]=DOPutMCCondIS(S0,X,r,T,sigma,Sb2,NStep,NRepl,bp20);
randn('seed',0);
[DOPutMCCondIS50,CI4,NCrossed4]=DOPutMCCondIS(S0,X,r,T,sigma,Sb2,NStep,NRepl,bp50);
randn('seed',0);
[DOPutMCCondIS200,CI5,NCrossed5]=DOPutMCCondIS(S0,X,r,T,sigma,Sb2,NStep,NRepl,bp200);

DOPutMC
CI1
NCrossed1
DOPutMCCondIS0
CI2
NCrossed2
DOPutMCCondIS20
CI3
NCrossed3
DOPutMCCondIS50
CI4
NCrossed4
DOPutMCCondIS200
CI5
NCrossed5

