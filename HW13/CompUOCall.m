clear;

S0=50;
X=50;
r=0.1;
T=2/12;
sigma=0.4;
Sb1=40*exp(-0.5826*0.4*sqrt(1/12/30));
Sb2=40;
NStep=60;
NRepl=50000;
randn('seed',0);
%DOPutdiscrete=DOPut(S0,X,r,T,sigma,Sb1);

[UOCallMC,CI,NCrossed]=UOCallMC(S0,X,r,T,sigma,Sb2,NStep,NRepl);

CI
NCrossed

%[DOPutMCAV,CI,NCrossed]=DOPutMCAV(S0,X,r,T,sigma,Sb2,NStep,NRepl);
%DOPutMCAV
%CI
%NCrossed


