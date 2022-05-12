% AmPutImpl.m
function price = AmPutImpl(S0,X,r,T,sigma,Smax,dS,dt)
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
matval(1,:) = 0;
matval(M+1,:) = X-Smax;

% set up the tridiagonal coefficients matrix
a = 0.5*(r*dt*vetj-sigma^2*dt*(vetj.^2));
b = 1+sigma^2*dt*(vetj.^2)+r*dt;
c = -0.5*(r*dt*vetj+sigma^2*dt*(vetj.^2));
coeff = diag(a(3:M),-1) + diag(b(2:M)) + diag(c(2:M-1),1);
[L,U] = lu(coeff);

% solve the sequence of linear systems
aux = zeros(M-1,1);
for j=N:-1:1
   aux(1) = - a(2) * matval(1,j);
   %matval(2:M,j) = U \ (L \ (matval(2:M,j+1) + aux));
   matval(2:M,j) = max(coeff \ (matval(2:M,j+1) + aux),X*ones(M-1,1)-vetS(2:M));
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



