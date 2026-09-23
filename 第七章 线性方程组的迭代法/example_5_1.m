% Jacobi 迭代法（分量形式）求解方程组
clear;
% 输入值
A = [10, -1, -2; -1, 10, -2; -1, -1, 5];
b = [7.2; 8.3; 4.2];
tol = 1e-5;
xk = [0; 0; 0];   % 迭代初始向量
xk_1 = [0; 0; 0];

A_ = A;
for i = 1 : length(A)
    A_(i,i) = 0;    % 对角线元素设置为0
end
for i = 0 : 19
    for j = 1 : length(A)
        xk_1(j,1) = (b(j) - sum(A_(j,:)*xk))/A(j,j);  % Jacobi迭代公式(分量形式)
    end

    if (max(abs(xk - xk_1)) < tol)
        fprintf('迭代次数: %d\n', i);
        fprintf('方程组的根: %10.8f\n', xk_1);
        break;
    end
    xk = xk_1;
end