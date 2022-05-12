%LookbackHalton.m
function[P,CI] = LookbackHalton(S0,r,T,sigma,NSteps,NRepl)
Payoff = zeros(NRepl,1);
Path = HaltonPaths(S0,r,sigma,T,NSteps,NRepl);
SMax = max(Path,[],2);
%SMin = min(Path,[],2);
Payoff = max(0,SMax-Path(NSteps+1));
%Payoff = max(0,Path(NSteps+1)-SMin);
[P,aux,CI] = normfit(exp(-r*T)*Payoff);
end