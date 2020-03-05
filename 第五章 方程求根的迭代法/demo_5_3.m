% Newton 迭代法的局部收敛性
clear; clc
f = @(x) x^3 - x -1;
df = @(x) 3*x^2 - 1;

N = 100;
tol = 1e-6;
%x0 = 1.5; % 初值接近根  f(x0)*f(x)的二阶导数 > 0 , 凹&初值正数 or 凸&初值为负数
x0 = 0.008; % 初值远离根
for k = 1 : N
    x = x0 - f(x0)/df(x0);
    fprintf('k=%d, x=%.8f\n',k,x);
    if abs(x-x0)<tol
        fprintf('迭代次数: %d\n', k);
        fprintf('方程的正根: %10.8f\n', x);
        break; 
    end
    x0 = x;
end
if k == N
    fprintf('迭代方法失败\n');
end
