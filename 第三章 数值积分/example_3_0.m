% 基本思想 几个简单公式
clear; clc;
% 被积函数 F
F = @(x) (+1.0146-0.88571.*(x-0.20046)+4.4375.*(x-0.20046).*(x-0.75346)-2.8282.*(x-0.20046).*(x-0.75346).*(x-1.1129)+2.8895.*(x-0.20046).*(x-0.75346).*(x-1.1129).*(x-2.3433)+0.62844*(x-0.20046).*(x-0.75346).*(x-1.1129).*(x-2.3433).*(x-1.9562)); 
a = 1.0;   % 积分区间下限
b = 2.5;   % 积分区间上限
h = 0.05;  % 绘图步长
xi = a : h : b;
yi = F(xi);
xl = 0.5; xr = 3; yb= 0; yt = 5;    % 坐标系可视区域

% 定积分的几何意义
subplot(2,3,1)
plot(xi,yi);
hold on;
stem(xi,yi,'k');
title('数值积分基本思想演示');
axis([xl xr yb yt]); grid on;

% 左矩形公式
subplot(2,3,2)
plot(xi,yi);
hold on;
y = yi(1) * ones(size(xi));   % 左点函数值
stem(xi,y,'k');
title('左点法');
axis([xl xr yb yt]); grid on;

% 右矩形公式
subplot(2,3,3)
plot(xi,yi);
hold on;
y = yi(end) * ones(size(xi));  % 右点函数值
stem(xi,y,'k');
title('右点法');
axis([xl xr yb yt]); grid on;

% 中矩形公式
subplot(2,3,4)
plot(xi,yi);
hold on;
y = F((a+b)/2) * ones(size(xi));  % 中点函数值
stem(xi,y,'k');
title('中点法');
axis([xl xr yb yt]); grid on;

% 梯形公式
subplot(2,3,5)
y = yi(1)*(xi-b)/(a-b) + yi(end)*(xi-a)/(b-a);    % 线性插值
plot(xi,yi);
hold on;
stem(xi,y,'k');
title('梯形公式');
axis([xl xr yb yt]); grid on;

% 抛物线公式
subplot(2,3,6)
xz=(a+b)/2; yz = F(xz);   % 被积函数的中点 
y = yi(1)*(xi-b).*(xi-xz)./((a-b)*(a-xz)) + yz*(xi-a).*(xi-b)./((xz-a).*(xz-b)) + yi(end)*(xi-a).*(xi-xz)./((b-a)*(b-xz));    % 抛物线插值
plot(xi,yi);
hold on;
stem(xi,y,'k');
title('抛物线公式');
axis([xl xr yb yt]); grid on;
