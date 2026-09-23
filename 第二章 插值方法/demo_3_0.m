% 分段线性插值 点击定位插值点
% 按return键结束程序
clear;clc;
xl = -3; xr = 3; yb= -3; yt = 3;    % 可视区域
plot([xl xr], [0 0], 'k', [0 0], [yb yt], 'k');
grid on;
xlist = []; ylist = [];    % 存储用户选择插值节点的横纵坐标
k = 0;
while(0 == 0)
    [xnew, ynew] = ginput(1);   % 用户点击可视区域选择插值节点
    if length(xnew) < 1
        break
    end
    k = k+1;
    xlist(k) = xnew;
    ylist(k) = ynew;
    if k == 1
        continue;
    end
    x = xl : 0.01 : xr;          % 待插值点，绘制曲线的横坐标    
    y = interp1(xlist,ylist,x); % 根据插值函数求出的近似值
    
    [m,c] = d_d(xlist, ylist);   % 根据插值节点计算差商表，返回对角线元素
    x_newton = xl : 0.01 : xr;          % 待插值点，绘制曲线的横坐标
    y_newton = nest(c, x_newton, xlist);       % 计算待插值点的纵坐标    
    
    
    A = [length(xlist), sum(xlist); sum(xlist), sum(xlist .* xlist)];   % 法方程系数矩阵
    b = [sum(ylist); sum(xlist .* ylist)];    % 法方程常数项
    % pa = inv(A)*b;   % 左乘逆矩阵，求解法方程组
    pa = A\b;

    pa = pa(end : -1 : 1); % 多项式系数
    %px = 0 : 0.01 : 10;   % 画直线函数的横坐标
    y_fitting = polyval(pa, x);   % 多项式求值

%     plot(xlist, ylist, 'o', x, y, [xl xr], [0 0], 'k', [0 0], [yb yt], 'k', x_newton, y_newton, x, y_fitting);  
     plot(xlist, ylist, 'o', [xl xr], [0 0], 'k', [0 0], [yb yt], 'k', x_newton, y_newton, x, y_fitting);  
    %plot(xlist, ylist, 'o', [xl xr], [0 0], 'k', [0 0], [yb yt], 'k', x, y_fitting);  
    title('插值、曲线拟合演示');
    axis([xl xr yb yt]); grid on;
end
    