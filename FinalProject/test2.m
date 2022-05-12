clear;
data = gamma_rainfal;
callprice = zeros(1,3,5);
k = 1;
s = 100; %standard
for i = 1:5  %地區
    for j =1:3  %月份
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

function data = gamma_rainfal
tainan = "雨量(台南)";
taitung = "雨量(台東)";
kaohsiung = "雨量(高雄)";
pingtung = "雨量(屏東)";
hualien = "雨量(花蓮)";
place = [tainan, taitung, kaohsiung, pingtung, hualien];

for i = 1:5
    alpha_beta = zeros(2,3);
    for j = 1:3
        deta = xlsread(place(i),j);
        deta =deta(:);
        m = mean(deta);
        v = var(deta);
        alpha_beta(2,j) = v/m;
        alpha_beta(1,j) = m/alpha_beta(2,j);
    end
    alpha_beta_all(:,:,i) = alpha_beta;
end
    data = alpha_beta_all;
end