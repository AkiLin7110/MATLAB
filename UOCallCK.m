% UOCallCK.m
function price = UOCallCK(S0,X,r,T,sigma,Sb,Smax,dS,dt)
% set up grid and adjust increments if necessary
M = round((Smax-Sb)/dS);
dS = (Smax-Sb)/M;
N = round(T/dt);
dt = T/N;
matval = zeros(M+1,N+1);
vetS = linspace(Sb,Smax,M+1)'
vetj = 0:N;
veti = vetS / dS;
% set up boundary conditions
matval(:,N+1) = max(vetS-X,0);
matval(1,:) = 0;
matval(M+1,:) = 0;

% set up the coefficients matrix
alpha = 0.25*dt*( sigma^2*(veti.^2) - r*veti );
beta = -dt*0.5*( sigma^2*(veti.^2) + r );
gamma = 0.25*dt*( sigma^2*(veti.^2) + r*veti );
M1 = -diag(alpha(3:M),-1) + diag(1-beta(2:M)) - diag(gamma(2:M-1),1);
[L,U] = lu(M1);
M2 = diag(alpha(3:M),-1) + diag(1+beta(2:M)) + diag(gamma(2:M-1),1);

% solve the sequence of linear systems
for j=N:-1:1
   matval(2:M,j) = U \ (L \ (M2*matval(2:M,j+1)));
end

% find closest point to S0 on the grid and return price
% possibly with a linear interpolation
idown = floor((S0-Sb)/dS);
iup = ceil((S0-Sb)/dS);
if idown == iup
   price = matval(iup+1,1);
else
   price = matval(iup+1,1) + (Sb-S0-iup*dS)*(matval(iup+2,1) - matval(iup+1,1))/dS;
end 



