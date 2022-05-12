% HaltonPaths.m
function SPaths=HaltonPaths(S0,mu,sigma,T,NSteps,NRepl)
dt = T/NSteps;
nudt = (mu-0.5*sigma^2)*dt;
sidt = sigma*sqrt(dt);
NRepl = 2*ceil(NRepl/2); % make sure it's even
% Use Box Muller to generate standard normals
RandMat = zeros(NRepl, NSteps);
seeds = myprimes(2*NSteps);
Base1 = seeds(1:NSteps);
Base2 = seeds((NSteps+1):(2*NSteps));

for i=1:NSteps
   H1 = GetHalton(NRepl/2,Base1(i));
   H2 = GetHalton(NRepl/2,Base2(i));
   VLog = sqrt(-2*log(H1));
   Norm1 = VLog .* cos(2*pi*H2);
   Norm2 = VLog .* sin(2*pi*H2);
   RandMat(:,i) = [Norm1 ; Norm2];
end
Increments = nudt + sidt*RandMat;
LogPaths = cumsum([log(S0)*ones(NRepl,1) , Increments] , 2);
SPaths = exp(LogPaths);


