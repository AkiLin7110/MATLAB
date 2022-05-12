%MCIntegration
clear;
rand('seed',1);
N = 1000;
meanexp = zeros(1,N);
for i = (1:N)
    meanexp(i) = mean(exp((rand(1,i)*2)))*2;
end
exp =  exp(1)-1
exp10 = meanexp(10)
exp100 = meanexp(100)
exp1000 = meanexp(1000)
plot(1:N,meanexp);