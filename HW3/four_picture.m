%Plotoptions.m
X = 50;
c = 2;
p = 2;
St = 40:0.05:60;

%long call
subplot(2,2,1);
plot(St,max(St - X,0)-c);
title('long call');
xlabel('S');
ylabel('profit');
axis([40 60 -10 10])

%short call
subplot(2,2,2);
plot(St,c-max(St - X,0));
title('long call');
xlabel('S');
ylabel('profit');
axis([40 60 -10 10])

%long put
subplot(2,2,3);
plot(St,max(X-St,0)-p);
title('long call');
xlabel('S');
ylabel('profit');
axis([40 60 -10 10])

%short put
subplot(2,2,4);
plot(St,p-max(X-St,0));
title('long call');
xlabel('S');
ylabel('profit');
axis([40 60 -10 10])

