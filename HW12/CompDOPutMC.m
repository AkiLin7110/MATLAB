%Compute DOPutQMC by Quasi MC
clear;

S0 = 50;
X = 50;
r = 0.1;
T = 2/12;
sigma = 0.4;
Sb = 30;
Base1 = 2;
Base2 = 3;
NPoints = 100;
randn('seed',0);

DOPutQMC = DoPutHalton(S0,X,r,T,sigma,NPoints,Base1,Base2,Sb);

