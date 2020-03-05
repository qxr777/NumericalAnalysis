% Newton方法（切线法）利用开方公式求115的平方根
clear;
format long;
tol = 1e-6;
N = 100;
x0 = 10;
c = 115;
phi = @(x) (x + c / x) / 2;  % 二次方程对应的牛顿公式

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