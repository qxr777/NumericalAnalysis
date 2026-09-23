%  演示调用 消去法
clear;
A=[2,-1,3; 4, 2, 5; 1, 2, 0];
b=[1;4;7];

%  调用 高斯消去法
x = my_ge(A, b)

%  调用 列主元高斯消去法
%x = my_ge_with_column_pivoting(A, b)

% 直接调用matlab左除运算符
x_ = A\b

