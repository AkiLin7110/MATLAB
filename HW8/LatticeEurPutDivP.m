function [price,lattice] = LatticeEurPutDivP(S0,X,r,T,sigma,N,div,tau)
deltaT = T/N;
u = exp(sigma*sqrt(deltaT));
d = 1/u;
p = (exp(r*deltaT) - d)/(u-d);
lattice = zeros(N+1,N+1);

%最後一期
for j = 0:N
    lattice(N+1,j+1) = max(0,X-S0*(u^j)*(d^(N-j))*(1-div));
end
%直到發放股利
for i = N-1:-1:tau
    for j = 0:i
        lattice(i+1,j+1) = exp(-r*deltaT)*(p*lattice(i+2,j+2)+(1-p)*lattice(i+2,j+1));
    end 
end
for i =tau-1:-1:0
    for j = 0:i
        lattice(i+1,j+1) = exp(-r*deltaT)*(p*lattice(i+2,j+2)+(1-p)*lattice(i+2,j+1));
    end      
end
price = lattice(1,1)
end