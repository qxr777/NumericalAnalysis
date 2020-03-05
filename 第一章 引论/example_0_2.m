% 二分法求方程近似根
clear;
f = @(x) x ^ 3 - x -1;
a = 1;
b = 1.5;
tol = 1e-5;
n = 1;

y0 = f(a);
while (abs(b - a) > tol)
    x = (a + b) / 2;
    y = f(x);
    if (y * y0 > 0)
        a = x;
    else
        b = x;
    end
    n = n + 1;
end
x
fprintf('迭代次数: %d\n', n);