% CompBlsMCCV.m Compare blsprice and BlsMc200000 and BlsMCCV195000

S0=50;
X=52;
r=0.1;
T=5/12;
sigma=0.4;
NPilot=5000;
NRepl1=195000;
NRepl2=200000;
Bls=blsprice(S0,X,r,T,sigma);
randn('seed',0);
[MC200000, CI1] = BlsMC(S0,X,r,T,sigma,NRepl2);
randn('seed',0);
[MCCV195000, CI2] = BlsMCCV(S0,X,r,T,sigma,NRepl1,NPilot);

Bls
MC200000
CI1
MCCV195000
CI2