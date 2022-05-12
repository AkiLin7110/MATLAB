function [price, lattice] = test(S0,X,r,T,sigma,N,D,tau)
 deltaT = T/N;
 u=exp(sigma * sqrt(deltaT));
 d=1/u;
 p=(exp(r*deltaT) - d)/(u-d);
 S0a=S0-D*exp(-r*tau*deltaT)
 lattice = zeros(N+1,N+1);
 for j=0:N
    lattice(N+1,j+1) = max(0 , X-S0a*(u^j)*(d^(N-j)));
 end
 for i=N-1:-1:tau
    for j=0:i
    lattice(i+1,j+1) = max( X-S0a*u^j*d^(i-j) , exp(-r*deltaT) *(p * lattice(i+2,j+2) + (1-p) * lattice(i+2,j+1)));
    end
 end
 for i=tau-1:-1:0
     for j=0:i
         lattice(i+1,j+1) = max( X-S0a*u^j*d^(i-j)-D*exp(-r*(tau-i)*deltaT) , exp(-r*deltaT) *(p * lattice(i+2,j+2) + (1-p) * lattice(i+2,j+1)));
     end
 end
 price = lattice(1,1);
end
 