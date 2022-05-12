function [price,lattice] = LatticeAmPut(S0,X,r,rf,T,sigma,N,last)
deltaT = T/N;
u = exp(sigma*sqrt(deltaT));
d = 1/u;
p = (exp((r-rf)*deltaT) - d)/(u-d);
lattice = zeros(N+1,N+1);
for j = 0:N
    lattice(N+1,j+1) = last
end
for i = N-1:-1:0
    for j = 0:i
        lattice(i+1,j+1) = max(50*((S0-X(i+1))/S0)*(u^j)*(d^(i-j)),exp(-r*deltaT)*(p*lattice(i+2,j+2)+(1-p)*lattice(i+2,j+1)))
    end
end
price = lattice(1,1);
end