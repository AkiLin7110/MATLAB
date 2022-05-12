% BlsTrMCAV.m
function [Price, CI] = BlsTrMCAV(S0,X,r,T,sigma,Sb,NRepl)

nuT = (r - 0.5*sigma^2)*T;
siT = sigma * sqrt(T);
Veps = randn(NRepl,1);

StockPrice1 = S0*exp(nuT+siT*Veps);
StockPrice2 = S0*exp(nuT-siT*Veps);
Clip1 = find(StockPrice1 > Sb);
Clip2 = find(StockPrice2 > Sb);
StockPrice1(Clip1) = 0;
StockPrice2(Clip2) = 0;

Payoff1 = max( 0 , StockPrice1 - X);
Payoff2 = max( 0 , StockPrice2 - X);
DiscPayoff = exp(-r*T) * 0.5 * (Payoff1+Payoff2);
[Price, VarPrice, CI] = normfit(DiscPayoff);
end
