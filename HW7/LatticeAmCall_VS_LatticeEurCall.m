%AmCallVSEurCall
%input
S0 = 50;
X = 50;
r = 0.1;
sigma = 0.4;
T = 5/12; %for 內建
N = 5;
q = 0.1;
%BLS
[BlsC,BlsP] = blsprice(S0,X,r,T,sigma);
LatticeAmC = zeros(1,N);
LatticeC = zeros(1,N);
for i = (1:N)
    LatticeAmC(i) = LatticeAmCall(S0,X,r,T,sigma,i);
    LatticeC(i) = LatticeEurCall(S0,X,r,T,sigma,i); 
end
plot(1:N, ones(1,N)*BlsC);
hold on;
plot(1:N,LatticeAmC);
hold on;
plot(1:N, LatticeC);
xlabel('N');
ylabel('Call');
