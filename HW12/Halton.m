%Halton.m
function h = Halton(n,b)
n0 = n;
h = 0;
f = 1/b;
while (n0 > 0)
   n1 = floor(n0/b); % 取商
   r = n0 - n1*b; % 餘數
   h = h+f*r; 
   f = f/b;
   n0=n1;
end
n0
h
f