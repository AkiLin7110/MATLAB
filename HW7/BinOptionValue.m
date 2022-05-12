function [price, lattice] = BinOptionValue(imod,S0, X,r,q,T,sigma,N)
deltaT = T/N;
if imod == 0
    %JR
    rnmut = (r-q-0.5*sigma^2)*deltaT;
    u = exp(rnmut+sigma*sqrt(deltaT));
    d = exp(rnmut-sigma*sqrt(deltaT));
    p = 0.5; %為求期望值,backward
else
    %CRR
    u = exp(sigma*sqrt(deltaT));
    d = 1/u;
    p = (exp((r-q)*deltaT)-d)/(u-d);
end
lattice = zeros(N+1,N+1);
for j = 0:N
    lattice(N+1,j+1) = max(0,S0*(u^j)*(d^(N-j))-X);
end
for i = N-1:-1:0
    for j = 0:i
        lattice(i+1,j+1) = exp(-r*deltaT)*(p*lattice(i+2,j+2)+(1-p)*lattice(i+2,j+1));
    end
end
price = lattice(1,1);
end