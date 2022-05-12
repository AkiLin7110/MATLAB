%MCPath.m
randn('seed',0);
paths = AssetPaths(50,0.1,0.3,1,365,3);
plot(1:length(paths),paths(1,:));
hold on;
plot(1:length(paths),paths(2,:));
hold on;
plot(1:length(paths),paths(3,:));
hold on;
