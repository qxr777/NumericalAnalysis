% Newton 迭代法的局部收敛性
clear; 
f = @(x) x^5 + 10*x^3 + 20*x - 4;   % 韦东奕方程 [0, 1]，解析解 8^(1/5)-2/8^(1/5) 或 -4^(1/5)+2/4^(1/5)
df = @(x) 5*x^4 + 30*x^2 +20;

N = 15;  % 最大迭代次数
tol = 1e-7;
x0 = 0.5; 
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
