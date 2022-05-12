function [price,lattice] = LatticeEurCallDivD(S0,X,r,T,sigma,N,D,tau)
deltaT = T/N;
u = exp(sigma*sqrt(deltaT));
d = 1/u;
p = (exp(r*deltaT) - d)/(u-d);
S0a = S0-D*exp(-r*tau*deltaT);
lattice = zeros(N+1,N+1);

%最後一期
for j = 0:N
    lattice(N+1,j+1) =  max(0 , S0a*(u^j)*(d^(N-j))-X);
end
%回推直到發放股利前
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