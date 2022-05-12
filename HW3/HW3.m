%PlotlongputBS.m
X = 50;
c = 2;
r = 0.01;
T = 0.5;
sigma = 0.2;
St = 40:0.05:60;
[m,n] = size(St);
for i = 1:n
    [call(i),put(i)] = fcn_bs(St(i),X,r,T,sigma);
end
plot(St,max(X-St,0),'--black');

%畫在一起
hold on;

plot(St,call,'*blue');
title('long put');
xlabel('S');
ylabel('profit');
axis([40 60 0 10]);


%C = S0*normcdf(d1)-x*(exp(-r*t)*normcdf(d2));
%P = x*exp(-r*t)*normcdf(-d2)-S0*normcdf(-d1);