%input
x = 0;
n = 3;
C1 = 10;
C2 = 10;
C3 = 110;
y = 0.1;
d = 1+y;
for i=1:n
    eval(['x','=','x','+','C',num2str(i),'/','d',';']);
    d = d*(1+y); 
    %disp(d);
end