% 复合求积基本思想
clear; clc;
% 被积函数 F
F = @(x) (+1.0146-0.88571.*(x-0.20046)+4.4375.*(x-0.20046).*(x-0.75346)-2.8282.*(x-0.20046).*(x-0.75346).*(x-1.1129)+2.8895.*(x-0.20046).*(x-0.75346).*(x-1.1129).*(x-2.3433)+0.62844*(x-0.20046).*(x-0.75346).*(x-1.1129).*(x-2.3433).*(x-1.9562)); 

a = 1.0;   % 积分区间下限
b = 2.5;   % 积分区间上限
hi = 0.05;  % 绘图步长
xi = a : hi : b;
yi = ones(size(xi)) .* F(xi);
N = 4;    % 分段数
xs = linspace(a, b, N + 1);   % 样本点 x 坐标，分段点
ys = F(xs);       % 样本点 y 坐标
xl = 0.5; xr = 3; yb= 0; yt = 5;    % 坐标系可视区域

% 复合梯形法的几何意义
subplot(1,2,1);
plot(xi,yi, xs, ys, 'rp-');
hold on;
stem(xi,yi,'k');
title('复合梯形法的几何意义');
axis([xl xr yb yt]); grid on;

% 复合Simpson法的几何意义
subplot(1,2,2);
xm = xs(1 : end-1) + (b - a) / (2 * N);
ym = F(xm);
plot(xi,yi, xs, ys, 'rp', xm, ym, 'bp');
hold on;
for i = 1 : N
    xna = xs(i); yna = ys(i);
    xnb = xs(i+1); ynb = ys(i+1);
    xnm = xm(i); ynm = ym(i);
    xni = linspace(xna, xnb, 100);
    yni = yna*(xni-xnm).*(xni-xnb)./((xna-xnm).*(xna-xnb)) + ynm * (xni - xna) .* (xni - xnb) ./ ((xnm - xna) .* (xnm - xnb)) + ynb * (xni - xna).*(xni-xnm) ./ ((xnb-xna).*(xnb-xnm));
    plot(xni, yni);
    hold on;
end
stem(xi,yi,'k');
title('复合Simpson法的几何意义');
axis([xl xr yb yt]); grid on;

