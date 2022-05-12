[NUM,TXT,RAW] = xlsread('TXO_0325','E2:E92');
t = str2num(RAW{77,1})
for i = 1:2:length(RAW);
    c = str2num(RAW{i,1});
    if isempty(c);
        C(i) = 0;
    elseif c(1) ==1;
        C(i) = c(1)*1000+c(2);
    else    
        C(i) = c(1);
    end;
end;