% 改进的欧拉法求解初值问题
clear;
f = @(x,y) (y - 2 * x / y);
h = 0.1;   % 步长
x = 0:h:2;  % 离散点
y(1) = 1;   % 初值
y_xn = (1 + 2 * x).^(1/2);   % 解析解

% 改进的欧拉法
for i = 2 : length(x)
    yp = y(i-1) + h * f(x(i-1),y(i-1));
    yc = y(i-1) + h * f(x(i),yp);    
    y(i) = (yp + yc) / 2;
end
y
y_xn
plot(x,y,'o-',x,y_xn,'k-'); 
legend('改进的欧拉法','精确解');
