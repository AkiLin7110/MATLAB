%input
S0 = 100;
x = 100;
r = 0.02;
t = 1;
sigma = 0.2;

d1 = fcn_d1(S0,x,r,t,sigma);
d2 = fcn_d2(d1,sigma,t);
C = S0*normcdf(d1)-x*(exp(-r*t)*normcdf(d2));
P = x*exp(-r*t)*normcdf(-d2)-S0*normcdf(-d1);