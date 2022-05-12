%CompLookbackMCHalton.m
S0 = 50;
X = 50;
r = 0.1;
T = 1;
sigma = 0.4;
NSteps = 365;
NRepl = 1000;
PMC = LookbackMC1(S0,r,T,sigma,NSteps,NRepl);
PHalton = LookbackHalton(S0,r,T,sigma,NSteps,NRepl);
PMC
PHalton