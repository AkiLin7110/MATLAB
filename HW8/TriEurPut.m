%TriEurPut
function [price,lattice] = TriEurPut(S0,X,r,T,sigma,N,lamda)
deltaT = T/N;
u = exp(lamda*sigma*sqrt(deltaT));
d = 1/u;
pu = 1/(2*lamda^2)+(r-(sigma^2/2))*sqrt(deltaT)/(2*lamda*sigma);
pm = 1-1/(lamda^2);
pd = 1-pu-pm;
lattice = zeros(N+1,2*N+1);
for j = 1:N+1
    lattice(N+1,j) = max(0,X-S0*(d^(N-j+1)));
end
for j =N+2:2*N+1
    lattice(N+1,j) = max(0,X-S0*(u^(j-N-1)));
end
for i = N-1:-1:0
    for j = 1:2*i+1
        lattice(i+1,j) = exp(-r*deltaT)*(pd*lattice(i+2,j)+pm*lattice(i+2,j+1)+pu*lattice(i+2,j+2));
    end
price = lattice(1,1);
end