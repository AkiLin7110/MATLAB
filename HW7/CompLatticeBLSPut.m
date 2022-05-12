%CompLatticeBLSPut.m
%input
S0 = 50;
X = 50;
r = 0.1;
sigma = 0.4;
T = 5/12; %for 內建
N = 50;
[BlsC,BlsP] = blsprice(S0,X,r,T,sigma);
LatticeP = zeros(1,N);
for i = (1:N)
    LatticeP(i) = LatticeEurPut(S0,X,r,T,sigma,i);
end
plot(1:N, ones(1,N)*BlsP);
hold on;
plot(1:N, LatticeP);
xlabel('N');
ylabel('Put');