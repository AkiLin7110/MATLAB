mean = 7.894031669
variance = 911.8979034
syms a b;
[a,b] = solve(mean-(a*b),variance-(a*(b^2)));

