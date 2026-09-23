% 迭代法求解方程的唯一正根
clear;
format long;
tol = 1e-7;
N = 20;
x0 = 0.5;

for k = 1 : N
    x1 = (x0 + 1) ^ (1 / 3);
    if abs(x1 - x0) < tol
        fprintf('方程的正根: %10.8f\n', x1);
        break;
    end
    x0 = x1;
end
if k == N
    fprintf('迭代方法失败');
end
fprintf('迭代次数: %d\n', k);