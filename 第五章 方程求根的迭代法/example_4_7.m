% Newton下山法 当初值选择不当时 调整下山因子lamda
clear;
format long;
tol = 1e-5;
N = 100;
x0 = 0.6;
lamda = 1;
f = @(x) x^3 - x - 1;  %f(x)表达式
df = @(x) 3*x^2 - 1;
fprintf('f(x)的初值: %d\n', abs(f(x0)));
for k = 1 : N
    x1 = x0 - f(x0)/ df(x0);
     while abs(f(x1)) > abs(f(x0))
         lamda = lamda / 2;   % 下山因子减半
         fprintf('下山因子减半后的值: %d\n', lamda);
         x1 = x0 - lamda * f(x0) / df(x0);
     end
    fprintf('本次迭代f(x)的值: %d\n', abs(f(x1)));
    if abs(x1 - x0) < tol
        fprintf('迭代次数: %d\n', k);
        fprintf('方程的正根: %10.8f\n', x1);
        break;
    end
    x0 = x1;
end
if k == N
    fprintf('迭代方法失败\n');
end