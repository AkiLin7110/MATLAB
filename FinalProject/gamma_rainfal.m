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
        data = xlsread(place(i),j);
        data =data(:);
        %rand("seed",1);
        %sample = randsample(data,100);
        m = mean(data);
        v = var(data);
        alpha_beta(2,j) = v/m;
        alpha_beta(1,j) = m/alpha_beta(2,j);
    end
    alpha_beta_all(:,:,i) = alpha_beta;
end
    data = alpha_beta_all;
end