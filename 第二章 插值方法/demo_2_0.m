% 多项式插值 点击定位数据点
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
    [m,c] = d_d(xlist, ylist);   % 根据插值节点计算差商表，返回对角线元素
    
    poly_exp = 'y = '; omiga_exp = '';
    for index = 1 : length(c)  
        if c(index) >= 0
            coef_str = ['+', num2str(c(index))];
        else
            coef_str = num2str(c(index));
        end
      poly_exp = [poly_exp, coef_str,omiga_exp];
        if -xlist(index) >= 0 
            omiga_sub = ['+', num2str(-xlist(index))];
        else
            omiga_sub = num2str(-xlist(index));
        end
      omiga_exp = [omiga_exp, '(x', omiga_sub,')'];
    end
    
    
    x = xl : 0.01 : xr;          % 待插值点，绘制曲线的横坐标
    y = nest(c, x, xlist);       % 计算待插值点的纵坐标    
    plot(xlist, ylist, 'o', x, y, [xl xr], [0 0], 'k', [0 0], [yb yt], 'k');
    title('多项式插值演示');
    text(xl, yt - 0.5, poly_exp);
    axis([xl xr yb yt]); grid on;
end
    