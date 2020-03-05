% Newton方法（切线法）求解方程
clear;
format long;
tol = 1e-5;
N = 100;
x0 = 0.5;
phi = @(x) x - (x - exp(-x)) / (1 + x);  % 题干方程对应的牛顿公式

for k = 1 : N
    x1 = phi(x0);
    if abs(x1 - x0) < tol
        fprintf('方程的正根: %10.8f\n', x1);
        break;
    end
    x0 = x1;
end
if k == N
    fprintf('迭代方法失败\n');
end