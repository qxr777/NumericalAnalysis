%  演示调用 LU 分解的紧凑方式
clear;
A=[1 2 3; 2 5 2; 3 1 5];
b=[14;18;20];

% LU三角分解法
[L, U, x] = my_lu(A, b)

% 列主元LU三角分解法
%[L, U, x] = my_lu_with_column_pivoting(A, b)

% 直接调用matlab左除运算符
x_ = A\b