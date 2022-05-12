product = 1; %單位 : t
percentage = 14/100;
PP = 9680; %木瓜價格
P = callprice(:,2,4); %8月屏東
days = 3; %當月下雨天數
loss = percentage*product*PP %損失金額
Payoff = 3*1000
Profit = Payoff-loss-P



