%input
n = 3;
C1 = 10;
C2 = 10;
C3 = 110; 
%x,y軸
x = zeros(1,0.5/0.05+1);
y = zeros(1,0.5/0.05+1);
j = 1; %j為列序
%pv
for r = 0 : 0.05: 0.5 %r = 實質利率
    %disp('r');
    %disp(r);
    pv = 0;
    d = 1+r; %d = 折現因子
    for i=1:n  %i = 期數
        eval(['pv','=','pv','+','C',num2str(i),'/','d',';']);
        d = d*(1+r); 
        %disp(d);
    end
    %disp(pv);
    y(j) = pv;
    x(j) = r;
    j = j+1;
end
plot(x,y);
title('Bond Price');
ylabel('bond price');
xlabel('r');
