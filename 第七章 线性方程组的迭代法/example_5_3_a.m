% 超松弛法（矩阵形式） 求解方程组
clear;
% 输入值
A = [10, -1, -2; -1, 10, -2; -1, -1, 5];
b = [7.2; 8.3; 4.2];
tol = 1e-5;
N = 100;   % 最大迭代次数
omega = 1.07;  % 松弛因子,取值区间(0, 2),取值1.0x时加速效果好
x = [0; 0; 0];

D = diag(diag(A));  % A 的对角线部分
L = D - tril(A);    % -L 为 A 的严格下三角部分
U = D - triu(A);    % -U 为 A 的严格上三角部分

for k = 0 : N
    y = (D-omega*L) \ ( ((1-omega)*D + omega*U)*x + omega*b );
    if (max(abs(x - y)) < tol)
        fprintf('迭代次数: %d\n', k);
        fprintf('方程组的根: %10.8f\n', y);
        break;
    end
    x = y;
end
if k == N
    fprintf('迭代方法失败\n');
end