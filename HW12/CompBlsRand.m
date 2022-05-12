% CompRandHalton.m Compare blsprice and RandHalton

S0=50;
X=52;
r=0.1;
T=5/12;
sigma=0.4;
NRepl=5000;
Base11=2;Base12=7;
Base21=11;Base22=7;
Base31=2;Base32=4;

Bls=blsprice(S0,X,r,T,sigma);
Random27 = BlsRandom(S0,X,r,T,sigma,NRepl,Base11,Base12);
Random117 = BlsRandom(S0,X,r,T,sigma,NRepl,Base21,Base22);
Random24 = BlsRandom(S0,X,r,T,sigma,NRepl,Base31,Base32);

Bls
Random27
Random117
Random24
