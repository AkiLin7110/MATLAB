function lattice = BinTree(imod, S0,r,q,T, sigma, N)
deltaT = T/N;
if imod == 0
    rnmut = (r-q-0.5*sigma^2)*deltaT;
    u = exp(rnmut+sigma*sqrt(deltaT));
    d = exp(rnmut-sigma*sqrt(deltaT));
else
    u = exp(sigma*sqrt(deltaT));
    d = 1/u;
end
lattice = ones(N+1,N+1)*S0;
for i = 2:N+1
    lattice(i,1) = 0;
end
for j = 2:1:N+1
    for i = 1:j-1
        lattice(i,j) = u*lattice(i,j-1);
    end
    lattice(j,j) = d*lattice(j-1,j-1);
    for i = j+1:N+1
        lattice(i,j) = 0;
    end
end
end

