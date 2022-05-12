x = 0;
d = 1+y;
for(i = 1: 4)
    a=x+ci/d;
    x=a
    d=d*(1+y);
end
    
return x;