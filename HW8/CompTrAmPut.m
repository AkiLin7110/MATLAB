%CompTrAmPut.m
S0 = 50;
X = 50;
r = 0.04879;
sigma = 0.2;
T = 6/12;
N = 50;
lamda = 1.41412;
Eur = TriEurPut(S0,X,r,T,sigma,N,lamda)
Am = TriAmPut(S0,X,r,T,sigma,N,lamda)