% CompImpl3D.m Compare blsprice and BlsHalton


[ExpdS1,matval,vetS,vetT]=EuCallImplall(S0,X,r,T,sigma,Smax,dS,dT);

matval
ExpdS1
mesh(vetT,vetS,matval);
ylabel('Stock price'); xlabel('Time'); title('European Put Option, Implicit Method');
