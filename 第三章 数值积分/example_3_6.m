% Newton-Cotes公式求数值积分几何意义演示
clear;
format long;
% 被积函数 F
F = @(x) (+1.0146-0.88571.*(x-0.20046)+4.4375.*(x-0.20046).*(x-0.75346)-2.8282.*(x-0.20046).*(x-0.75346).*(x-1.1129)+2.8895.*(x-0.20046).*(x-0.75346).*(x-1.1129).*(x-2.3433)+0.62844*(x-0.20046).*(x-0.75346).*(x-1.1129).*(x-2.3433).*(x-1.9562)); 
a = 1.0;   % 积分区间下限
b = 2.5;   % 积分区间上限
N = 60;    % 样本点数
xi = linspace(a,b,N);
yi = F(xi);
xl = 0.5; xr = 3; yb= 0; yt = 5;    % 坐标系可视区域

% Newton-Cotes系数表
Ck{1} = [1/2, 1/2];
Ck{2} = [1/6, 2/3, 1/6];
Ck{3} = [1/8, 3/8, 3/8, 1/8];

% 定积分的几何意义
subplot(2,2,1)
plot(xi,yi);
hold on;
stem(xi,yi,'k');
title('定积分几何意义');
axis([xl xr yb yt]); grid on;

% n = 1
subplot(2,2,2)
plot(xi,yi);
hold on;
y = ones(size(xi));   
y(1:N*Ck{1}(1)) = F(a);          % 左点函数值
y(N*Ck{1}(2) + 1 : end) = F(b);  % 右点函数值
stem(xi,y,'k');
title('n = 1');
axis([xl xr yb yt]); grid on;

% n = 2
subplot(2,2,3)
plot(xi,yi);
hold on;
y = ones(size(xi));
y(1 : round(N*Ck{2}(1))) = F(a);          % 左点函数值
xz=(a+b)/2; yz = F(xz);          % 被积函数的中点 
y(round(N*Ck{2}(1)) : round(N*(Ck{2}(1) + Ck{2}(2)))) = yz;  % 中点函数值
y(round(N*(Ck{2}(1) + Ck{2}(2))) : end) = F(b);       % 右点函数值
stem(xi,y,'k');
title('n = 2');
axis([xl xr yb yt]); grid on;

% n = 3
subplot(2,2,4)
plot(xi,yi);
hold on;
y = ones(size(xi));
y(1:round(N*Ck{3}(1))) = F(a);          % 左点函数值
xz = a + (b - a) / 3; yz = F(xz);          % 被积函数的1/3点 
y(round(N*Ck{3}(1)) : round(N*(Ck{3}(1) + Ck{3}(2)))) = yz;  % 1/3点函数值
xz = a + 2 * (b - a) / 3; yz = F(xz);          % 被积函数的2/3点 
y(round(N*(Ck{3}(1) + Ck{3}(2))) : round(N*(Ck{3}(1) + 2 * Ck{3}(2)))) = yz;  % 2/3点函数值
y(round(N*(Ck{3}(1) + 2 * Ck{3}(2))) : end) = F(b);       % 右点函数值
stem(xi,y,'k');
title('n = 3');
axis([xl xr yb yt]); grid on;