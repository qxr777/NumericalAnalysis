% 四阶龙格库塔经典格式，debug，动图显示
clear;
f = @(x,y) (y - 2 * x / y);
h = 0.2;
a = 0;
b = 2;
x = a:h:b;
x_xn = a:0.01:b;
y(1) = 1; % 初值
y_xn = (1 + 2 * x_xn).^(1/2);  % 精确值
plot(x_xn,y_xn,'k-'); 
hold on;
grid on;

for i = 2 : length(x)
    x0 = x(i-1);
    y0 = y(i-1);
    x1 = x(i);
    K1 = f(x0,y0);
    lh1 = line([x0,x0 + h/2], [y0, y0 + h/2*K1],'Color','red','Marker', 'o');     
    K2 = f(x0 + h / 2, y0+h/2*K1);
    %lp2 = line([x0 + h/2, x0 + h], [y0+h/2*K1, y0 + h/2*K1 + h/2*K2]);
    lh2 = line([x0, x0+h/2], [y0, y0 + h/2*K2], 'Color','green','Marker', 'o'); 
    K3 = f(x0 + h / 2, y0 + h / 2 * K2);
    %lp3 = line([x0+h/2, x0+h], [y0+h/2*K2, y0+h/2*K2+h/2*K3]);
    lh3 = line([x0, x0+h], [y0, y0 + h*K3], 'Color','blue','Marker', 'o'); 
    K4 = f(x0 + h, y0 + h * K3);
    %lp4 = line([x0+h, x0+2*h], [y0 + h * K3, y0 + h * K3 + h * K4]);
    lh4 = line([x0, x0+h], [y0, y0 + h*K3], 'Color','magenta','Marker', 'o'); 
    y(i) = y0 + h / 6 * (K1 + 2 * K2 + 2 * K3 + K4);
    plot(x(i-1:i), y(i-1:i), 'o-');
    lh1.Visible = 'off'; lh2.Visible = 'off'; lh3.Visible = 'off'; lh4.Visible = 'off';
end
plot(x,y,'o-',x_xn,y_xn,'k-'); 
legend('精确解', '四阶龙格库塔经典格式');