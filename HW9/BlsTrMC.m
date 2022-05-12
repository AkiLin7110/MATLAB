% BlsTrMC.m
function [Price, CI] = BlsTrMC(S0,X,r,T,sigma,Sb,NRepl)
nuT = (r - 0.5*sigma^2)*T;
siT = sigma * sqrt(T);

StockPrice = S0*exp(nuT+siT*randn(NRepl,1));

Clip = find(StockPrice > Sb);
StockPrice(Clip) = 0;

DiscPayoff = exp(-r*T) * max( 0 , StockPrice - X);
[Price, VarPrice, CI] = normfit(DiscPayoff);
end