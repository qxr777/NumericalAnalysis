% 加速迭代方法求解方程 缺点是需要求解导数值L
clear;
format long;
tol = 1e-5;
N = 100;
x0 = 0.5;
phi = @(x) exp(-x);
L = -exp(-x0);  % 初值点的导数值

for k = 1 : N
    x1 = (1/(1-L)) * (phi(x0) - L * x0);
    if abs(x1 - x0) < tol
        fprintf('方程的正根: %10.8f\n', x1);
        break;
    end
    x0 = x1;
end
if k == N
    fprintf('迭代方法失败\n');
end