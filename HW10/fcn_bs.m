function [call,put]= fcn_bs(St,X,r,rf,T,sigma)
    d1 = fcn_d1(St,X,r,rf,T,sigma);
    d2 = fcn_d2(d1,sigma,T);
    call = St*exp(-rf*T)*normcdf(d1)-X*(exp(-r*T)*normcdf(d2));
    put = X*exp(-(r-rf)*T)*normcdf(-d2)-St*normcdf(-d1);
end