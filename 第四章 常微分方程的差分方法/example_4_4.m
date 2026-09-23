% 例题，不同步长，比较三种方法所得结果的精度
clear;
h = 0.001;   % 绘图步长
x = 0 : h : 1;  % 离散点
y(1) = 1;   % 初值
y_xn = exp(-x);   % 解析解
plot(x,y_xn,'k-'); 
hold on;

% 欧拉法
h1 = 0.025;
x = 0 : h1 : 1;
y1(1) = 1;
for i = 2 : length(x)
     y1(i) = 0.975 * y1(i-1);
end
plot(x,y1,'o-');
hold on;

% 改进的欧拉法
h2 = 0.05;
x = 0 : h2 : 1;
y2(1) = 1;
for i = 2 : length(x)
     y2(i) = 0.95125 * y2(i-1);
end
plot(x,y2,'o-');
hold on;

% 经典R—K格式
h3 = 0.1;
x = 0 : h3 : 1;
y3(1) = 1;
for i = 2 : length(x)
     y3(i) = 0.9048375 * y3(i-1);
end
plot(x,y3,'o-');
hold on;

% plot(x1,y1,'o-',x2,y2,'o-',x3,y3,'o-'); 
legend('精确解','欧拉法', '改进的欧拉法','经典R—K格式');
