% AmPutExpl1.m
function price = AmPutExpl1(S0,X,r,T,sigma,Smax,dS,dt)
% set up grid and adjust increments if necessary
M = round(Smax/dS);
dS = Smax/M;
N = round(T/dt);
dt = T/N;
matval = zeros(M+1,N+1);
vetS = linspace(0,Smax,M+1)';
veti = 0:N;
vetj = 0:M;
% set up boundary conditions
matval(:,N+1) = max(X-vetS,0);
matval(1,:) = 0; %Am
matval(M+1,:) = X-Smax; %Put
% set up coefficients 
a = 0.5*dt*(sigma^2*vetj - r).*vetj;
b = 1- dt*(sigma^2*vetj.^2 + r);
c = 0.5*dt*(sigma^2*vetj + r).*vetj;
% solve backward in time
for i=N:-1:1
   for j=2:M
      matval(j,i) = max(X-vetS(j),a(j)*matval(j-1,i+1)+ b(j)*matval(j,i+1)+ c(j)*matval(j+1,i+1));
   end
end
% find closest point to S0 on the grid and return price
% possibly with a linear interpolation
jdown = floor(S0/dS);
jup = ceil(S0/dS);
if jdown == jup
   price = matval(jdown+1,1);
else
   price = matval(jdown+1,1) + (S0 -jdown*dS)*(matval(jdown+2,1) - matval(jdown+1,1))/dS;
end 

