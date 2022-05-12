clear;

a = [0.1784 0.1885 0.0734]
b = [51.4604   86.6186  100.2920]

a=0.1220;
b=207.8012;
sz=[31 100000];
r=gamrnd(a,b,sz);
rl=length(r(r>50));
mean=rl/100000;
callprice=mean*100*exp(-0.04*(1/12));