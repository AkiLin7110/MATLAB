%input
S0 = 50;
X = 50;
r = 0.02;
T = 1; %for 內建
sigma = 0.2;
N = 10;
div = 0.1;
tau = 3;
%BLS
%[BlsC,BlsP] = blsprice(S0,X,r,T,sigma);
LatticeEurCD = zeros(1,N);
LatticeAmCD = zeros(1,N);
for i = (1:N)
    if i>=tau
        LatticeEurCD(i) = LatticeEurCallDivP(S0,X,r,T,sigma,i,div,tau);
        LatticeAmCD(i) = LatticeAmCallDivP(S0,X,r,T,sigma,i,div,tau);
    else
        LatticeEurCD(i) = LatticeEurCall(S0,X,r,T,sigma,i);
        LatticeAmCD(i) = LatticeAmCall(S0,X,r,T,sigma,i);
    end
end
%plot(1:N, ones(1,N)*BlsC);
plot(1:N,LatticeEurCD);
hold on;
plot(1:N, LatticeAmCD);
xlabel('N');
ylabel('Call');
