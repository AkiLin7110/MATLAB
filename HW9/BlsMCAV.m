% BlsMCAV.m
function [Price, CI] = BlsMCAV(S0,X,r,T,sigma,NRepl)
nuT = (r - 0.5*sigma^2)*T;
siT = sigma * sqrt(T);
Veps = randn(NRepl,1);

Payoff1 = max( 0 , X-S0*exp(nuT+siT*Veps) );
Payoff2 = max( 0 , X-S0*exp(nuT+siT*(-Veps)) );
DiscPayoff = exp(-r*T) * 0.5 * (Payoff1+Payoff2);
[Price, VarPrice, CI] = normfit(DiscPayoff);
end
