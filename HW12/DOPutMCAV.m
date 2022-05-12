% DOPutMCAV.m %use control variates to price barrier options
function [P,CI,NCrossed] = DOPutMCAV(S0,X,r,T,sigma,Sb,NSteps,NRepl)

% Generate asset paths
Payoff = zeros(NRepl,1);
Payoff1 = zeros(NRepl,1);
Payoff2 = zeros(NRepl,1);
NCrossed = 0;

for i=1:NRepl
   Path = (AssetPaths1(S0,r,sigma,T,NSteps,1)+AssetPaths1(S0,r,-sigma,T,NSteps,1))/2;
   crossed = any(Path <= Sb);
   if crossed == 0
      Payoff(i) = max(0, X - Path(NSteps+1));
   else
      Payoff(i) = 0;
      NCrossed = NCrossed + 1;
   end
end
[P,aux,CI] = normfit( exp(-r*T) * Payoff);