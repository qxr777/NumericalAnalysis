% 基于Newton法的开方公式
clear; clc

c = 115;
N = 10; % 最大迭代次数
tol = 1e-6;
x0 = 15; % 初值
for k = 1 : N
    x = 0.5 * (x0 + c / x0);
    fprintf('k=%d, x=%.8f\n',k,x);
    if abs(x - x0) < tol
        fprintf('方程的正根: %10.8f\n', x);
        break;
    end
    x0 = x;
end
fprintf('迭代次数: %d\n', k);
