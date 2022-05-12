% EuPutExpl1.m
function price = EuPutExpl1(S0,X,r,T,sigma,Smax,dS,dt)
% set up grid and adjust increments if necessary
M = round(Smax/dS);
dS = Smax/M;
N = round(T/dt);
dt = T/N;
matval = zeros(M+1,N+1);
vetS = linspace(0,Smax,M+1)';
vetj = 0:N;
veti = 0:M;
% set up boundary conditions
matval(:,N+1) = max(X-vetS,0);
matval(1,:) = X*exp(-r*dt*(N-vetj));
matval(M+1,:) = 0;
% set up coefficients 
a = 0.5*dt*(sigma^2*veti - r).*veti;
b = 1- dt*(sigma^2*veti.^2 + r);
c = 0.5*dt*(sigma^2*veti + r).*veti;
% solve backward in time
for j=N:-1:1
   for i=2:M
      matval(i,j) = a(i)*matval(i-1,j+1) + b(i)*matval(i,j+1)+ ...
         c(i)*matval(i+1,j+1);
   end
end
% find closest point to S0 on the grid and return price
% possibly with a linear interpolation
idown = floor(S0/dS);
iup = ceil(S0/dS);
if idown == iup
   price = matval(idown+1,1);
else
   price = matval(idown+1,1) + ...
      (S0 -(idown+1)*dS)*(matval(iup+1,1) - matval(iup,1))/dS;
end 

