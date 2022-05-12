%以美金為標的日元計價
%這裡可能sigma計算錯誤,導致價跟以S為標的不一樣
St = 1/106.47;
X1 = 1/169;
X2 = 2/169;
T = 10;
sigma = -10.2/100; %改為原來的1/s
r = 5.64/100; %美國利率
rf = 3.64 / 100 ;%日本利率

%BlsC1 = blsprice(St,X1,r,T,sigma,rf);
%BlsC2 = blsprice(St,X2,r,T,sigma,rf);
C1 = fcn_bs(St,X1,r,rf,T,sigma);  %若沒寫自動取值1
C2 = fcn_bs(St,X2,r,rf,T,sigma);
B = 1000;
%BlsP = 1000*exp(-r*T)-BlsC1+BlsC2;
P = B*exp(-r*T)-C1+C2