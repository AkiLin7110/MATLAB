%LookbackMC.m
function[P,CI] = LookbackMC(S0,r,T,sigma,NSteps,NRepl)
Payoff = zeros(NRepl,1);
for i = 1:NRepl
    Path = AssetPaths1(S0,r,sigma,T,NSteps,1);
    SMax = max(Path);
    %SMin = min(Path);
    Payoff(i) = max(0,SMax-Path(NSteps+1));
    %Payoff(i) = max(0,Path(NSteps+1)-SMin);
end
[P,aux,CI] = normfit(exp(-r*T)*Payoff);
end
