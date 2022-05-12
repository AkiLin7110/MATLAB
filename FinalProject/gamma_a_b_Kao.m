deta_all = xlsread("D:\NTHU\109下\109下金融商品設計與評價\FinalProject\雨量(高雄)");
deta_all(isnan(deta_all)) = 0;
deta_daily = zeros(1000,1);
for i  = 3:33
    for j = 2:3:37
        deta_daily((i-3)*36+(j-1)) = deta_all(i,j);
        


rand("seed",1);
sample = randsample(deta_daily,100);
mean = sum(sample)/100;
v = var(sample);

b = v/mean;
a = mean/b;