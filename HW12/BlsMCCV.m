% BlsMCCV.m
function [Price, CI] = BlsMCCV(S0,X,r,T,sigma,NRepl,NPilot)

nuT = (r - 0.5*sigma^2)*T;
siT = sigma * sqrt(T);

% compute parameters first 
StockVals = S0*exp(nuT+siT*randn(NPilot,1));
OptionVals = exp(-r*T) * max( 0 , StockVals - X);
MatCov = cov(StockVals, OptionVals);
VarY = S0^2 * exp(2*r*T) * (exp(T * sigma^2) - 1);
c = - MatCov(1,2) / VarY;
ExpY = S0 * exp(r*T);
 
NewStockVals = S0*exp(nuT+siT*randn(NRepl,1));
NewOptionVals = exp(-r*T) * max( 0 , NewStockVals - X);
ControlVars = NewOptionVals + c * (NewStockVals - ExpY);
[Price, VarPrice, CI] = normfit(ControlVars);
