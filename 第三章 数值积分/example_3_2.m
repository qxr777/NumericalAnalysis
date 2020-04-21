% 复合公式求数值积分
clear;
format long;
f = @(x) sin(x)./x; % 采用数组运算，使得函数可以作用在向量或矩阵上
a = 0; 
b = 1;
n = 8;
h = (b-a)/n;

X = a : h : b;
Y = f(X);
Y(1) = 1;  %  y(1)=0/sin(0)

% 复合梯形公式
Tn = Y(1) + 2*sum(Y(2:n)) + Y(n+1);
Tn = Tn*h/2;
fprintf('复合梯形公式计算的近似值为: %.10f\n', Tn);

% 复合 Simpson 公式
Sn = Y(1) + Y(n+1) + 4*sum(Y(2:2:n)) + 2*sum(Y(3:2:n-1));
Sn = Sn*h/3;
fprintf('复合Simpson公式计算的近似值为: %.10f\n', Sn);

fprintf('精确值为: %.10f\n', quad(f, 0, 1));