% 快速弦截法求解方程
clear;
format long;
tol = 1e-5;
N = 100;
x0 = 0.5;
x1 = 0.6;
%f = @(x) x * exp(x) - 1; % f(x)表达式
f = @(x) x^3 - x - 1;  %f(x)表达式

for k = 1 : N
    x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
    if abs(x2 - x1) < tol
        fprintf('迭代次数: %d\n', k);
        fprintf('方程的正根: %10.8f\n', x1);
        break;
    end
    x0 = x1;
    x1 = x2;
end
if k == N
    fprintf('迭代方法失败\n');
end