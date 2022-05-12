%導入excel
[NUM,TXT,RAW] = xlsread('TXO_0325','D2:D92');
k = str2num(cell2mat(RAW));
j = 0
for i = 1:2:length(k);
    j = j+1;
    K(j) = k(i,1)*1000 + k(i,2);
end;

K = K';
%BS_Formula
S0 = 16305.88; %台指期0325收盤
X = 16305.88; %價平
r = 0.01;
T = 1;
q = 0;
sigma = 0.2;
C = fcn_bs(S0,X,r,T,sigma);
SIG = blsimpv(S0,K,r,T,C);
%SIG = SIG(8:46);
%K = K(8:46);
plot(K,SIG);
xlabel('K');
ylabel('Sigma');