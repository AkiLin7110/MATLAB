data = gamma_rainfal;
callprice = zeros(1,3,5);
k = 1;
s = 100; %standard
for i = 1:5 %地區
    for j =1:3 %月份
            a = data(k,j,i);
            b = data(k+1,j,i);
            if ( j ~= 3 )
                sz = [31 100000];
            else
                sz = [30 100000];
            end
            
            rng('default');
            s = rng;
            r = gamrnd(a,b,sz);
            rl = length(r(r>100));
            mean = rl/100000;
            
            tmp = mean*1000*exp(-0.04*(1/12));
            callprice(1,j,i) = tmp;         
    end
end   