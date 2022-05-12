% AsianMCCV.m
function [P,CI] = AsianMCCV(S0,X,r,T,sigma,NSamples,NRepl,NPilot)

% pilot replications to set control parameter
TryPath=AssetPaths1(S0,r,sigma,T,NSamples,NPilot);
StockSum = sum(TryPath,2);
PP = mean(TryPath(:,2:(NSamples+1)) , 2);
TryPayoff = exp(-r*T) * max(0, X - PP);
MatCov = cov(StockSum, TryPayoff);
c = - MatCov(1,2) / var(StockSum);
dt = T / NSamples;
ExpSum = S0 * (1 - exp((NSamples + 1)*r*dt)) / (1 - exp(r*dt));

% MC run
ControlVars = zeros(NRepl,1);
for i=1:NRepl
   StockPath = AssetPaths1(S0,r,sigma,T,NSamples,1);
   Payoff = exp(-r*T) * max(0, mean(StockPath(2:(NSamples+1))-X));
   ControlVars(i) = Payoff + c * (sum(StockPath) - ExpSum);
end
[P,aux,CI] = normfit(ControlVars);

