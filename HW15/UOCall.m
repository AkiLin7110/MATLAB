% UOCall.m
function P = UOCall(S0,X,r,T,sigma,Sb)

a = (S0/Sb)^(-1 + (2*r / sigma^2)); 
b = (S0/Sb)^(1 + (2*r / sigma^2)); 
d1 = (log(X/S0) + (r+sigma^2 / 2)* T) / (sigma*sqrt(T));
d2 = (log(X/S0) + (r-sigma^2 / 2)* T) / (sigma*sqrt(T));
d3 = (log(Sb/S0) + (r+sigma^2 / 2)* T) / (sigma*sqrt(T));
d4 = (log(Sb/S0) + (r-sigma^2 / 2)* T) / (sigma*sqrt(T));
d5 = (log(Sb/S0) - (r-sigma^2 / 2)* T) / (sigma*sqrt(T));
d6 = (log(Sb/S0) - (r+sigma^2 / 2)* T) / (sigma*sqrt(T));
d7 = (log(Sb*X/S0^2) - (r-sigma^2 / 2)* T) / (sigma*sqrt(T));
d8 = (log(Sb*X/S0^2) - (r+sigma^2 / 2)* T) / (sigma*sqrt(T));
P = S0*(normcdf(d3)-normcdf(d1) - b*(normcdf(d8)-normcdf(d6)))-X*exp(-r*T)*(normcdf(d4)-normcdf(d2) - a*(normcdf(d7)-normcdf(d5)));
