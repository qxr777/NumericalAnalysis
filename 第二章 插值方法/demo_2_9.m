% spline 举例
clear; clc;

xi=[27.7, 28, 29, 30]; % 插值节点
yi=[4.1, 4.3, 4.1, 3.0]; % 节点处的函数值
df0=3.0; dfn=-4.0; % 边界条件
pp=spline(xi,[df0, yi, dfn]);

xh=27.7:0.1:30; % 需要插值的点
yh=ppval(pp,xh); % 通过插值求得的近似值 
plot(xi,yi,'r+',xh,yh,'o-b','LineWidth',1.5,'MarkerSize',12);
