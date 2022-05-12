function d1 = fcn_d1(S0,x,r,rf,t,sigma)
    d1 =(log(S0/x)+((r-rf)+sigma^2/2)*t)/(sigma*sqrt(t));
    %disp(d1);
end
