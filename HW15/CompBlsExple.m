% CompBlsExpl.m Compare blsprice and BlsExpl

S0=50;
X=50;
r=0.1;
T=5/12;
sigma1=0.4;
sigma2=0.3;
Smax=100;
dS1=2;
dS2=1.5;
dS3=1;
dT=5/1200;
[c1,p04]=blsprice(S0,X,r,T,sigma1);
Exps04=EuCallExpl1(S0,X,r,T,sigma1,Smax,dS1,dT);
[c2,p03]=blsprice(S0,X,r,T,sigma2);
Exps03dS2=EuCallExpl1(S0,X,r,T,sigma2,Smax,dS1,dT);
ExpdS15=EuCallExpl1(S0,X,r,T,sigma2,Smax,dS2,dT);
ExpdS1=EuCallExpl1(S0,X,r,T,sigma2,Smax,dS3,dT);

p04
Exps04
p03
Exps03dS2
ExpdS15
ExpdS1



