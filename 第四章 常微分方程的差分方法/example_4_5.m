% 改进的欧拉法求解初值问题，动图演示
clear;
f = @(x,y) (y - 2 * x / y);
h = 0.2;   % 步长
x = 0:h:2;  % 离散点
y(1) = 1;   % 初值
y_xn = (1 + 2 * x).^(1/2);   % 解析解
plot(x,y_xn,'k-'); 
hold on;

% 改进的欧拉法
for i = 2 : length(x)
    yp = y(i-1) + h * f(x(i-1),y(i-1));    % 预报
    yz = y(i-1) + f(x(i-1),y(i-1)) * (x - x(i-1));
    lh1 = line(x,yz);

    yc = y(i-1) + h * f(x(i),yp);          
    yz = y(i-1) + f(x(i),yp) * (x - x(i-1));
    lh2 = line(x,yz);    
    
    y(i) = (yp + yc) / 2;      % 校正
    plot(x(i-1:i), y(i-1:i), 'o-');
    hold on;
    
    lh1.Visible = 'off'; lh2.Visible = 'off';
end

legend('改进的欧拉法','精确解');
