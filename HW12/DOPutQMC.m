%DoPutHalton.m
%pricing down and out Put using HaltonPahts
function Price = DoPutQMC(S0,X,r,T,sigma,NPoints,Base1,Base2,Sb)
nuT = (r-0.5*sigma^2)*T;
siT = sigma*sqrt(T);

%Use BoxMuller to generate standard normals
H1 = GetHalton(ceil(NPoints/2),Base1);
H2 = GetHalton(ceil(NPoints/2),Base2);
VLog = sqrt(-2*log(H1));
Norm1 = VLog.*cos(2*pi*H2);
Norm2 = VLog.*sin(2*pi*H2);
Norm = [Norm1;Norm2];

%Generate asset paths
Payoff = zeros(NPoints,1);
NCrossed = 0;
Path = S0*exp(nuT+siT*Norm);
for i = 1:NPoints
    crossed = any(Pats <= Sb)
    if crossed ==0
        Payoff(i) = max(0,X-Path(NPoints));
    else
        Payoff(i) = 0;
        NCrossed = NCrossed+1;
    end
end
Price = mean(exp(-r*T)*Payoff);
        
