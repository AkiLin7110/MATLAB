%input
S0 = 50;
X = 40;
r = 0.02;
T = 1; %for 內建
sigma = 0.2;
N = 10;
div = 0.1;
tau = 1;
%BLS
%[BlsC,BlsP] = blsprice(S0,X,r,T,sigma);
LatticeEurCD = zeros(1,N);
LatticeAmCD = zeros(1,N);
for i = (1:N)
    if i>=tau
        LatticeEurPD(i) = LatticeEurPutDivD(S0,X,r,T,sigma,i,div,tau);
        LatticeAmPD(i) = LatticeAmPutDivD(S0,X,r,T,sigma,i,div,tau);
    else
        LatticeEurPD(i) = LatticeEurPut(S0,X,r,T,sigma,i);
        LatticeAmPD(i) = LatticeAmPut(S0,X,r,T,sigma,i);
    end
end
%plot(1:N, ones(1,N)*BlsC);
plot(1:N,LatticeEurPD);
hold on;
plot(1:N, LatticeAmPD);
xlabel('N');
ylabel('Put');
