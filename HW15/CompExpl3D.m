% CompExpl3D.m Compare blsprice and BlsHalton

S0=50;
X=50;
r=0.1;
T=5/12;
sigma=0.3
Smax=100;
dS=2; %dS=1.2;
dT=5/1200;
[ExpdS1,matval,vetS,vetT]=EuPutExplall(S0,X,r,T,sigma,Smax,dS,dT);

matval
ExpdS1
mesh(vetT,vetS,matval);
ylabel('Stock price'); xlabel('Time'); title('European Put Option, Explicit Method');

