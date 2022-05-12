%AmPutCK.m
function price = AmCallCK(S0,X,r,T,sigma,Smax,dS,dt)

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

alpha = 0.25*dt*( sigma^2*(vetj.^2) - r*vetj );
beta = -dt*0.5*( sigma^2*(vetj.^2) + r );
gamma = 0.25*dt*( sigma^2*(vetj.^2) + r*vetj );
M1 = -diag(alpha(3:M),-1) + diag(1-beta(2:M)) - diag(gamma(2:M-1),1);
[L,U] = lu(M1);
M2 = diag(alpha(3:M),-1) + diag(1+beta(2:M)) + diag(gamma(2:M-1),1);

for i=N:-1:1
   matval(2:M,i) = max(U \ (L \ (M2*matval(2:M,i+1))),X*ones(M-1,1)-vetS(2:M));
end

jdown = floor(S0/dS);
jup = ceil(S0/dS);
if jdown == jup
   price = matval(jdown+1,1);
else
   price = matval(jdown+1,1) + (S0-jdown*dS)*(matval(jdown+2,1) - matval(jdown+1,1))/dS;
end 