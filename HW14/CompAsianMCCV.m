% CompAsianMCCV.m Compare blsprice and BlsHalton

S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.4;
NSamples= 5;
NRepl1=50000;
NRepl2=45000;
NPilot=5000;

rand('seed',0);
[PMC,CIMC]=AsianMC(S0,X,r,T,sigma,NSamples,NRepl1);
rand('seed',0);
[PMCCV,CIMCCV]=AsianMCCV(S0,X,r,T,sigma,NSamples,NRepl2,NPilot);

PMC
CIMC
CIMC(2)-CIMC(1)
PMCCV
CIMCCV
CIMCCV(2)-CIMCCV(1)

