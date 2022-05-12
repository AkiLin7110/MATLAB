% CompBlsHalton.m Compare blsprice and BlsHalton

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
Halton27 = BlsHalton(S0,X,r,T,sigma,NRepl,Base11,Base12);
Halton117 = BlsHalton(S0,X,r,T,sigma,NRepl,Base21,Base22);
Halton24 = BlsHalton(S0,X,r,T,sigma,NRepl,Base31,Base32);

Bls
Halton27
Halton117
Halton24
