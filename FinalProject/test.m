%取出天數的mean and variance
clear;
rain = 50; %以多少雨量為knock in
times = 1000000 ;%模擬的次數
days = 0; %天數
tmp = zeros(1,times);
tmp_2 = zeros(1,times);
sum = 0;
sum_2 = 0;
rand('seed',0);
for i = 1:times
    a = random('gamma', 0.2138 , 81.2025,[1 31]);
    days = 0;
    for j = 1:31
        if a(j) >= rain
            days=days+1;
        end
    end
    tmp(i) = days;
    sum = sum+tmp(i);
    sum_2 = sum_2 + tmp(i)^2;
end

mean = sum/times;
mean_2 = sum_2/times;
variance = mean_2-mean^2;