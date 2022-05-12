function [price,lattice] = LatticeEurPut(S0,X,r,T,sigma,N)
    deltaT = T/N;
    u = exp(sigma*sqrt(deltaT));
    d = 1/u; % ud = 1;
    p = (exp(r*deltaT) - d)/(u-d);
    lattice = zeros(N+1, N+1);
    for j = 0:N
        lattice(N+1,j+1) = max(0,X-S0*(u^j)*(d^(N-j)));
    end
    for i = N-1:-1:0
       for j = 0:i
           lattice(i+1,j+1) = exp(-r*deltaT)*(p*lattice(i+2,j+2)+(1-p)*lattice(i+2,j+1));
       end
    end
price = lattice(1,1)
end