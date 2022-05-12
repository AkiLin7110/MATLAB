%AssetPaths1.m
function SPaths = AssetPaths1(S0,mu,sigma,T,NSteps,NRepl)
dt = T/NSteps;
nudt = (mu-0.5*sigma^2)*dt;
sidt = sigma*sqrt(dt);
Increments = nudt+sidt*randn(NRepl, NSteps);
LogPaths = cumsum([log(S0)*ones(NRepl,1),Increments],2);
%increments 大寫！
SPaths = exp(LogPaths);
end