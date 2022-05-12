% CompAsianHalton.m

S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.4;
NSamples=5;
NRepl1=1000;
NRepl2=2000;
NRepl3=3000;
NRepl4=10000;
NRepl5=30000;

%CompBlsHaltonAV.m
AsianHalton1000=AsianHalton(S0,X,r,T,sigma,NSamples,NRepl1);
AsianHalton2000=AsianHalton(S0,X,r,T,sigma,NSamples,NRepl2);
AsianHalton3000=AsianHalton(S0,X,r,T,sigma,NSamples,NRepl3);
AsianHalton10000=AsianHalton(S0,X,r,T,sigma,NSamples,NRepl4);
AsianHalton30000=AsianHalton(S0,X,r,T,sigma,NSamples,NRepl5);

AsianHalton1000
AsianHalton2000
AsianHalton3000
AsianHalton10000
AsianHalton30000
