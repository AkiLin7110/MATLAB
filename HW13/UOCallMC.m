% UOCallMC.m
function [C,CI,NCrossed] = UOCallMC(S0,X,r,T,sigma,Sb,NSteps,NRepl)
% Generate asset paths
Payoff = zeros(NRepl,1);
NCrossed = 0;
Path=AssetPaths1(S0,r,sigma,T,NSteps,1);
for i=1:NRepl
   Path=AssetPaths1(S0,r,sigma,T,NSteps,1);
   crossed = any(Path >= Sb+40);
   if crossed == 0
      Payoff(i) = max(0, Path(NSteps+1)-X);
   else
      Payoff(i) = 0;
      NCrossed = NCrossed + 1;
   end
end
[C,aux,CI] = normfit( exp(-r*T) * Payoff);
