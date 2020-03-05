% 四阶龙格库塔经典格式
clear;
f = @(x,y) (y - 2 * x / y);
h = 0.2;
x = 0:h:2;
y_xn = (1 + 2 * x).^(1/2);  % 精确值
y(1) = 1;
for i = 2 : length(x)
    x0 = x(i-1);
    y0 = y(i-1);
    x1 = x(i);
    K1 = f(x0,y0);
    K2 = f(x0 + h / 2, y0+h/2*K1);
    K3 = f(x0 + h / 2, y0 + h / 2 * K2);
    K4 = f(x0 + h, y0 + h * K3);
    y(i) = y0 + h / 6 * (K1 + 2 * K2 + 2 * K3 + K4);
end
plot(x,y,'o-',x,y_xn,'k-'); 
legend('四阶龙格库塔经典格式','精确解');