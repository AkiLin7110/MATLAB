% UOCallMCCond.m
function [Cuo,CI,NCrossed] = UOCallMCCond(S0,X,r,T,sigma,Sb,NSteps,NRepl)
dt = T/NSteps;
[Call,Put] = blsprice(S0,X,r,T,sigma);
% Generate asset paths and payoffs for the down and in option
NCrossed = 0;
Payoff = zeros(NRepl,1);
Times = zeros(NRepl,1);
StockVals = zeros(NRepl,1);
for i=1:NRepl
   Path=AssetPaths1(S0,r,sigma,T,NSteps,1);
   tcrossed = min(find( Path <= Sb+20 ));
   if not(isempty(tcrossed))
      NCrossed = NCrossed + 1;
		Times(NCrossed) = (tcrossed-1) * dt;
		StockVals(NCrossed) = Path(tcrossed);
   end
end
if (NCrossed > 0)
   [Caux, Paux] = blsprice(StockVals(1:NCrossed),X,r,T-Times(1:NCrossed),sigma);
   Payoff(1:NCrossed) = exp(-r*Times(1:NCrossed)) .* Caux;
end
[Cuo, aux, CI] = normfit(Call - Payoff);
