% CompTrMCAV.m Compare BlsTrMc200000 and BlsTrMCAV100000

S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.4;
Sb=80; %修改此項發現單調性
NRepl1=100000;
NRepl2=200000;
randn('seed',0);
[TrMC200000, CI1] = BlsTrMC(S0,X,r,T,sigma,Sb,NRepl2);
randn('seed',0);
[TrMCAV100000, CI2] = BlsTrMCAV(S0,X,r,T,sigma,Sb,NRepl1);

TrMC200000
CI1(2)-CI1(1)
TrMCAV100000
CI2(2)-CI2(1)