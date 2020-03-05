% interp1 举例
clear; clc;

xi=0:pi/5:2*pi; % 将插值区间分成若干等距小区间
yi=sin(xi); % 插值节点处的函数值

xh=0:pi/50:2*pi; % 需要插值的点

% 分段线性插值
subplot(2,2,1)
yh=interp1(xi,yi,xh); % 根据插值函数求出的近似值
plot(xi,yi,'+r', xh,yh,'o-','LineWidth',1.5);
title('分段线性插值','FontSize',18)

% 分段零次插值
subplot(2,2,2)
yh=interp1(xi,yi,xh,'nearst'); % 用邻近的值近似
plot(xi,yi,'+r', xh,yh,'o-','LineWidth',1.5);
title('分段零次插值','FontSize',18)

% 分段三次 Hermite
subplot(2,2,3)
yh=interp1(xi,yi,xh,'pchip'); 
plot(xi,yi,'+r', xh,yh,'o-','LineWidth',1.5);
title('分段三次Hermite插值','FontSize',18)

% 分段三次样条插值
subplot(2,2,4)
yh=interp1(xi,yi,xh,'spline'); 
plot(xi,yi,'+r', xh,yh,'o-','LineWidth',1.5);
title('分段三次样条插值','FontSize',18)

