% 复合公式求河流水流量
clear;
format long;
a = 0; 
b = 700;
h = 50;
n = (b - a) / h;
v = 0.5;  % 流速 m/s

X = a : h : b;
Y = [4.2, 5.9, 5.8, 5.2, 4.5, 5.7, 5, 5.5, 4.8, 5.9, 4.1, 5.1, 4.6, 5.7, 4.7];

% 复合梯形公式
Tn = Y(1) + 2*sum(Y(2:n)) + Y(n+1);
Tn = Tn*h/2;
fprintf('复合梯形公式计算的河流横截面积近似值为: %f平方米\n', Tn);
fprintf('河流水流量为：%f立方米\n',Tn * v);

% 复合 Simpson 公式
Sn = Y(1) + Y(n+1) + 4*sum(Y(2:2:n)) + 2*sum(Y(3:2:n-1));
Sn = Sn*h/3;
fprintf('复合Simpson公式计算的河流横截面积近似值为: %f平方米\n', Sn);
fprintf('河流水流量为：%f立方米\n',Sn * v);
