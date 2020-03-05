% 求平方根的收敛速度

clear; clc
f = @(x) x^2-3;
g1 = @(x) x^2-3+x;
g2 = @(x) x-(x^2-3)/4;
g3 = @(x) 0.5*(x+3/x);

xt = sqrt(3); % 真解
n = 10; % 设置迭代步数
x0 = 2; % 迭代初始值
x1 = x0; x2 = x0; x3 = x0;

for k = 1 : n
    x1 = g1(x1); 
    x2 = g2(x2); 
    x3 = g3(x3); 
    fprintf('k=%d, err1=%.4e, err2=%.4e, err3=%.4e\n', ...
        k, norm(x1-xt), norm(x2-xt), norm(x3-xt));
end
    
