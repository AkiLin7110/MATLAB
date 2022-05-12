% EuCallImplall.m
function [price,matval,vetS,vetT] = EuPutImpl(S0,X,r,T,sigma,Smax,dS,dt)

% set up grid and adjust increments if necessary
M = round(Smax/dS);
dS = Smax/M;
N = round(T/dt);
dt = T/N;
matval = zeros(M+1,N+1);
vetS = linspace(0,Smax,M+1)';
vetj = 0:N;
veti = 0:M;
vetT= linspace(0,T,N+1)';
% set up boundary conditions
matval(:,N+1) = max(vetS-X,0);
matval(1,:) = X*exp(-r*dt*(N-vetj));
matval(M+1,:) = 0;

% set up the tridiagonal coefficients matrix
a = 0.5*(r*dt*veti-sigma^2*dt*(veti.^2));
b = 1+sigma^2*dt*(veti.^2)+r*dt;
c = -0.5*(r*dt*veti+sigma^2*dt*(veti.^2));
coeff = diag(a(3:M),-1) + diag(b(2:M)) + diag(c(2:M-1),1);
[L,U] = lu(coeff);

% solve the sequence of linear systems
aux = zeros(M-1,1);
for j=N:-1:1
   aux(1) = - a(2) * matval(1,j);
   matval(2:M,j) = U \ (L \ (matval(2:M,j+1) + aux));
end
% find closest point to S0 on the grid and return price
% possibly with a linear interpolation
idown = floor(S0/dS);
iup = ceil(S0/dS);
if idown == iup
   price = matval(idown+1,1);
else
   price = matval(idown+1,1) + ...
      (S0 - idown*dS)*(matval(idown+2,1) - matval(idown+1,1))/dS;
end 


