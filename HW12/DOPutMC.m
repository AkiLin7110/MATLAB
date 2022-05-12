% DOPutMC.m
function [P,CI,NCrossed] = DOPutMC(S0,X,r,T,sigma,Sb,NSteps,NRepl)

% Generate asset paths
Payoff = zeros(NRepl,1);
NCrossed = 0;
Path=AssetPaths1(S0,r,sigma,T,NSteps,1);
for i=1:NRepl
   Path=AssetPaths1(S0,r,sigma,T,NSteps,1);
   crossed = any(Path <= Sb);
   if crossed == 0
      Payoff(i) = max(0, X - Path(NSteps+1));
   else
      Payoff(i) = 0;
      NCrossed = NCrossed + 1;
   end
end
[P,aux,CI] = normfit( exp(-r*T) * Payoff);
