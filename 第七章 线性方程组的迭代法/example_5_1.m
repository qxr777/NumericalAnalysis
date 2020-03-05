% Jacobi 迭代法（分量形式）求解方程组
clear;
% 输入值
A = [10, -1, -2; -1, 10, -2; -1, -1, 5];
b = [7.2; 8.3; 4.2];
tol = 1e-5;
x = [0; 0; 0];
y = [0; 0; 0];

A_ = A;
for i = 1 : length(A)
    A_(i,i) = 0;    % 对角线元素设置为0
end
for i = 0 : 19
%     fprintf('第%d次迭代: \n', i);
    
%     y = (b - A_ * x) ./ diag(A);  % Jacobi迭代公式(分量形式)

    for j = 1 : length(A)
        y(j,1) = (b(j) - sum(A_(j,:)*x))/A(j,j);  % Jacobi迭代公式(分量形式)
    end

    if (max(abs(x - y)) < tol)
        fprintf('迭代次数: %d\n', i);
        fprintf('方程组的根: %10.8f\n', y);
        break;
    end
    x = y;
end